from django.core.management.base import BaseCommand, CommandError
from datetime import datetime
import pytz
import requests
from face_auth.models import ErrorLog, User, LatestModel, RealizerJob
from face_auth.tasks import send_trainingStatus_email
from website.settings.base import model_training_object, BASE_URL, BASE_DIR
import os

import logging
logger = logging.getLogger(__name__)

class Command(BaseCommand):
    help = 'Closes the specified poll for voting'

    def handle(self, *args, **options):
        data = RealizerJob.objects.filter(status=False, picked=False)
        for user in data:
            user.picked = True
            user.save()
        for user in data:
            log = ErrorLog(name=user.user_data.pf_number, message="Training Process Started!!",flag=2,
                           created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0),
                                                        "%Y-%m-%d %H:%M:%S"))
            log.save()
            validate_video_path, skipped_video = model_training_object.validation([user.user_data.video_file])
            if len(skipped_video) > 0:
                for skipped_name in skipped_video:
                    log = ErrorLog(name=skipped_name, flag=1, message="Person in this video is already available in Model!! Training Skipped!!",
                                   created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0), "%Y-%m-%d %H:%M:%S"))
                    log.save()
                    # data_pf = User.objects.filter(pf_number=user.pf_number)[0]
                    if user.user_data.is_trained == True:
                        pass
                    else:
                        user.user_data.is_trained = False
                        user.user_data.is_duplicate = True
                        user.user_data.is_reupload = True
                        user.user_data.save()
                    user.status = True
                    user.save()
                    os.remove(BASE_DIR+user.user_data.video_file)
                    message = "Your Training Is Skipped because you are already trained with another PF Number. "
                    send_trainingStatus_email.delay(user.user_data.username, user.user_data.email, message )
                    # data_pf.save()
            if len(validate_video_path) > 0:
                validation_count, output_folder  = model_training_object.video_to_images(validate_video_path)
                if not validation_count:
                    log = ErrorLog(name=user.user_data.pf_number, flag=1, message="Not Getting Proper Images From Video!! Training Skipped!!",
                                   created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0), "%Y-%m-%d %H:%M:%S"))
                    log.save()
                    if user.user_data.is_trained == True:
                        pass
                    else:
                        user.user_data.is_trained = False
                        user.user_data.is_reupload = True
                        user.user_data.save()
                    user.status = True
                    user.save()
                    os.remove(BASE_DIR+user.user_data.video_file)
                    message = "Not Getting Proper Images From Video!! Training Skipped!!<br>. You have to reupload new video from registration page. "
                    send_trainingStatus_email.delay(user.user_data.username, user.user_data.email, message )
                if validation_count:
                    status, check = model_training_object.encodings(output_folder)
                    if status:
                        log = ErrorLog(name=user.user_data.pf_number,flag=2, message="Facial Data is Gathered and Stored...",
                                       created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0), "%Y-%m-%d %H:%M:%S"))
                        log.save()
                        temp, merge_file_name = model_training_object.merge()
                        status, model_name = model_training_object.train(merge_file_name)
                        if status:
                            lates_model = LatestModel(model_name = model_name+".model", model_json=model_name+".json")
                            lates_model.save()
                            data_obj = ErrorLog(name="Latest Merge File",flag=2, message="Training Complete Successfully!!!",
                                                created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0), "%Y-%m-%d %H:%M:%S"))
                            data_obj.save()
                            # user = User.objects.get(pf_number=employID)
                            user.user_data.is_trained = True
                            user.user_data.save()
                            # user.save()
                            user.status = True
                            user.save()
                            os.remove(BASE_DIR+user.user_data.video_file)
                            message = "Training Completed Successfully!!,<br> Now you can mark your attendace easily."
                            send_trainingStatus_email.delay(user.user_data.username, user.user_data.email, message )
                            try:
                                response = requests.get(BASE_URL+"/api/loadnewmodel/")
                            except Exception as e:
                                data_obj = ErrorLog(name="Error",flag=2, message="New Model Is Not Loaded Successfully!!!",
                                                    created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0), "%Y-%m-%d %H:%M:%S"))
                                data_obj.save()
                                user.status = True
                                user.save()
                        else:
                            log = ErrorLog(name="Last Merge File", flag=1, message=model_name,
                                           created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0), "%Y-%m-%d %H:%M:%S"))
                            log.save()
                            user.status = True
                            user.save()
                    else:
                        log = ErrorLog(name=user.user_data.pf_number,flag=1, message=check,
                                       created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0), "%Y-%m-%d %H:%M:%S"))
                        log.save()
                        user.status = True
                        user.save()
        print("Training Process Ended....!!!")