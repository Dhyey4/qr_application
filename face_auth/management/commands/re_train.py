from django.core.management.base import BaseCommand, CommandError
from datetime import datetime
import pytz
import requests
from face_auth.models import ErrorLog, User, LatestModel, RealizerJob, RetrainWholeModel
from website.settings.base import model_training_object, BASE_DIR, BASE_URL
import os

class Command(BaseCommand):
    help = 'Closes the specified poll for voting'

    def handle(self, *args, **options):
        data = RetrainWholeModel.objects.filter(status=True)
        train = False
        for row in data:
            if(os.path.exists(BASE_DIR+"/media/input/single/"+row.delete_name+".pickle")):
                os.remove(BASE_DIR+"/media/input/single/"+row.delete_name+".pickle")
                train = True
        if train:
            temp, merge_file_name = model_training_object.merge()
            status, model_name = model_training_object.train(merge_file_name)
            if status:
                lates_model = LatestModel(model_name = model_name+".model", model_json=model_name+".json")
                lates_model.save()
                data_obj = ErrorLog(name="Delete", flag=2, message="Training Complete Successfully!!!",
                                    created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0), "%Y-%m-%d %H:%M:%S"))
                data_obj.save()
                try:
                    response = requests.get(BASE_URL+"/api/loadnewmodel/")
                    print(15*"*")
                    print(response.json())
                    print(15*"*")
                except Exception as e:
                    print(15*"*")
                    print(e)
                    data_obj = ErrorLog(name="Error", flag=2, message="New Model Is Not Loaded Successfully!!!",
                                        created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0), "%Y-%m-%d %H:%M:%S"))
                    data_obj.save()
                    print(15*"*")
            else:
                log = ErrorLog(name="Last Merge File",flag=1, message=model_name,
                               created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0), "%Y-%m-%d %H:%M:%S"))
                log.save()
        print("Training Process Ended....!!!")