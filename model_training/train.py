
# from datetime import datetime
# import pytz
# import requests
# from background_task import background
# from face_auth.models import ErrorLog, User, ModelList, LatestModel
# from website.settings import model_training_object


# @background(schedule=10)
# def start_training(video_path, employID):
#     log = ErrorLog(name=employID, message="Getting Images From Video Process Started ",flag=2,
#                    created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0),
#                                                 "%Y-%m-%d %H:%M:%S"))
#     log.save()
#     validate_video_path, skipped_video = model_training_object.validation([video_path])
#     if len(skipped_video) > 0:
#         for skipped_name in skipped_video:
#             log = ErrorLog(name=skipped_name,flag=1, message="Person in this video is already available in Model!! Training Skipped!!",
#                            created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0), "%Y-%m-%d %H:%M:%S"))
#             log.save()
#             data_pf = User.objects.filter(pf_number=employID)[0]
#             data_pf.is_trained = True
#             data_pf.save()
#     if len(validate_video_path) > 0:
#         validation_count, output_folder = model_training_object.video_to_images(validate_video_path)
#         if not validation_count:
#             log = ErrorLog(name=employID,flag=1, message="Not Getting Proper Images From Video!! Training Skipped!!",
#                            created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0), "%Y-%m-%d %H:%M:%S"))
#             log.save()
#         if validation_count:
#             status, check = model_training_object.encodings(output_folder)
#             if status:
#                 log = ErrorLog(name=employID,flag=2, message="Facial Data is Gathered and Stored...",
#                                created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0), "%Y-%m-%d %H:%M:%S"))
#                 log.save()
#                 temp, merge_file_name = model_training_object.merge()
#                 status, model_name = model_training_object.train(merge_file_name)
#                 if status:
#                     lates_model = LatestModel(model_name = model_name+".model", model_json=model_name+".json")
#                     lates_model.save()
#                     data_obj = ErrorLog(name="Latest Merge File",flag=2, message="Training Complete Successfully!!!",
#                                         created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0), "%Y-%m-%d %H:%M:%S"))
#                     data_obj.save()
#                     user = User.objects.get(pf_number=employID)
#                     user.is_trained = True
#                     user.save()
#                     try:
#                         response = requests.get("http://127.0.0.1:8000/api/loadnewmodel/")
#                         print(15*"*")
#                         print(response.json())
#                         print(15*"*")
#                     except Exception as e:
#                         print(15*"*")
#                         print(e)
#                         data_obj = ErrorLog(name="Error",flag=2, message="New Model Is Not Loaded Successfully!!!",
#                                             created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0), "%Y-%m-%d %H:%M:%S"))
#                         data_obj.save()
#                         print(15*"*")
#                 else:
#                     log = ErrorLog(name="Last Merge File",flag=1, message=model_name,
#                                    created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0), "%Y-%m-%d %H:%M:%S"))
#                     log.save()
#             else:
#                 log = ErrorLog(name=employID,flag=1, message=check,
#                                created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0), "%Y-%m-%d %H:%M:%S"))
#                 log.save()


# @background(schedule=10)
# def retrain_data():
#     log = ErrorLog(name="Delete User", message="User Deleted Successfully!!! ",flag=2,
#                    created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0),
#                                                 "%Y-%m-%d %H:%M:%S"))
#     log.save()
#     temp, merge_file_name = model_training_object.merge()
#     status, model_name = model_training_object.train(merge_file_name)
#     if status:
#         lates_model = LatestModel(model_name = model_name+".model", model_json=model_name+".json")
#         lates_model.save()
#         data_obj = ErrorLog(name="Delete User",flag=2, message="Successfully Removed From Model",
#                             created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0), "%Y-%m-%d %H:%M:%S"))
#         data_obj.save()
#         try:
#             response = requests.get("http://127.0.0.1:8000/api/loadnewmodel/")
#             print(15*"*")
#             print(response.json())
#             print(15*"*")
#         except Exception as e:
#             print(15*"*")
#             print(e)
#             data_obj = ErrorLog(name="Error",flag=2, message="New Model Is Not Loaded Successfully!!!",
#                                 created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0), "%Y-%m-%d %H:%M:%S"))
#             data_obj.save()
#             print(15*"*")
#     else:
#         log = ErrorLog(name="Last Merge File",flag=1, message=model_name,
#                        created_at=datetime.strftime(datetime.now(pytz.timezone('Asia/Kolkata')).replace(microsecond=0), "%Y-%m-%d %H:%M:%S"))
#         log.save()
