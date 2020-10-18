import time
import keras
import numpy as np
import face_recognition
import cv2
import dlib
from keras.engine.saving import load_model
from tqdm import tqdm
import pickle
import pandas as pd
from sklearn.model_selection import train_test_split
from keras.utils import np_utils
from .model_structure import All_models
import json
from glob import glob
import datetime
import os
import math
import logging
logger = logging.getLogger(__name__)

class ModelTrainingScripts():

    def __init__(self, base_path):
        self.base_path = base_path
        self.detector = dlib.get_frontal_face_detector()
        self.images_folder = base_path+"/media/data/"
        self.encoding_path = base_path+"/media/input/single/"
        self.encoding_path_final = base_path+"/media/input/final_single/"
        self.merged_path = base_path+"/media/input/merge/"
        self.model_output = base_path+"/media/output/model/"
        self.model_output_json = base_path+"/media/output/model_json/"
        self.model_download_path = "/media/output/model/"
        self.json_download_path = "/media/output/model_json/"
        self.THRESHOLD = 0.96
        self.face_cascade = cv2.CascadeClassifier(base_path + '/media/haarcascade_frontalface_default.xml')
        self.load_latest_models()
        prototxtPath = base_path+"/media/deploy.prototxt"
        weightsPath = base_path+"/media/res10_300x300_ssd_iter_140000.caffemodel"
        self.net = cv2.dnn.readNet(prototxtPath, weightsPath)


    def result_from_model(self, face_data):
        face_encode = np.asarray([face_data])
        result = self.model.predict(face_encode)
        person = self.label[str(np.argmax(result[0]))]
        accuracy = result[0][np.argmax(result[0])]
        return person, accuracy

    def load_latest_models(self):
        keras.backend.clear_session()
        print(self.base_path+'/media/output/model/*')
        print(self.base_path+'/media/output/model_json/*')
        list_of_models = glob(self.base_path+'/media/output/model/*')
        list_of_jsons = glob(self.base_path+'/media/output/model_json/*')
        print(list_of_models)
        print(list_of_jsons)
        latest_model_file = max(list_of_models, key=os.path.getctime)
        latest_json_file = max(list_of_jsons, key=os.path.getctime)
        self.model_name = latest_model_file.split("/")[-1].split(".")[0]
        self.model = load_model(latest_model_file)
        self.model._make_predict_function()
        with open(latest_json_file, 'r') as fp:
            self.label = json.load(fp)


    def calculateDistance(self, x1,y1,x2,y2):
        dist = math.sqrt((x2 - x1)**2 + (y2 - y1)**2)
        return dist

    def get_predict(self, image_path):
            image = cv2.imread(self.base_path+image_path)
            (h, w) = image.shape[:2]
            rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
            blob = cv2.dnn.blobFromImage(image, 1.0, (300, 300), (104.0, 177.0, 123.0))
            print("[INFO] computing face detections...")
            faces =[]
            distance_list = []
            self.net.setInput(blob)
            detections = self.net.forward()
            print("total faces-->", detections.shape[2])
            logger.debug("total faces--> "+detections.shape[2])
            for i in range(0, detections.shape[2]):
                confidence = detections[0, 0, i, 2]
                if confidence > 0.88:
                    box = detections[0, 0, i, 3:7] * np.array([w, h, w, h])
                    (startX, startY, endX, endY) = box.astype("int")
                    faces.append([startX, startY, endX, endY])
                    distance_list.append(self.calculateDistance(startX, startY, endX, endY))
            print("total_faces_found", len(faces))
            logger.debug("total_faces_found " + len(faces))
            if (len(faces) == 0):
                return None, "NO Face Detected In Image!!"
            if (len(faces) > 0):
                index_value = distance_list.index(max(distance_list))
                (startX, startY, endX, endY) = faces[index_value]
                face_encodings = face_recognition.face_encodings(rgb, [[startY, endX, endY, startX]])
                if face_encodings:
                    person, accuracy = self.result_from_model(face_encodings[0])
                    print(person, accuracy)
                    logger.debug("Detected Person "+ person + " with accuracy "+ accuracy)
                    if accuracy > self.THRESHOLD:
                        return True, person
                    else:
                        return None, "Your image did not match, Can you try with one more image!!"
                return None, "Something Went Wrong!!!"


    def validation(self, video_path):
        print("Training Process Started")
        final_list_of_videofiles = []
        skipped_video = []
        for path in video_path:
            print(video_path)
            user_name = path.split("/")[-1].split(".")[0]
            full_path = self.base_path + path
            cap = cv2.VideoCapture(full_path)
            ratation = False
            final_rotation = None
            rotation_variation = [None, cv2.ROTATE_90_COUNTERCLOCKWISE, cv2.ROTATE_90_CLOCKWISE, cv2.ROTATE_180]
            ret, frame = cap.read()
            for option in rotation_variation:
                if option != None:
                    frame = cv2.rotate(frame, option)
                gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
                rects = self.detector(gray)
                if len(rects) > 0:
                    if option != None:
                        ratation = True
                    final_rotation = option
                    break
            try:
                validation_counter = 0
                validation_value_counter = 0
                while True:
                    if validation_counter == 5:
                        break
                    ret, frame = cap.read()
                    if ratation == True:
                        frame = cv2.rotate(frame, final_rotation)
                    (h, w) = frame.shape[:2]
                    rgb = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
                    blob = cv2.dnn.blobFromImage(frame, 1.0, (300, 300), (104.0, 177.0, 123.0))
                    self.net.setInput(blob)
                    detections = self.net.forward()
                    for i in range(0, detections.shape[2]):
                        confidence = detections[0, 0, i, 2]
                        if confidence > 0.6:
                            box = detections[0, 0, i, 3:7] * np.array([w, h, w, h])
                            (startX, startY, endX, endY) = box.astype("int")
                            face_encodings = face_recognition.face_encodings(rgb, [[startY, endX, endY, startX]])
                            if face_encodings:
                                person, accuracy = self.result_from_model(face_encodings[0])
                                print(person, accuracy)
                                logger.debug("Validation -> "+ person + " with accuracy "+ accuracy)
                                if accuracy > 0.999:
                                    validation_value_counter = validation_value_counter + 1
                                validation_counter = validation_counter + 1
                cap.release()
            except Exception as e:
                print("e-->", e)
                logger.exception(e)
                final_list_of_videofiles.append(path)
            if validation_value_counter > 3:
                skipped_video.append(user_name)
                # log = ErrorLog(name=user_name, message="Person in this video is already available in Model!! Training Skipped!!")
                # log.save()
            else:
                final_list_of_videofiles.append(path)
        print(final_list_of_videofiles, skipped_video)
        return final_list_of_videofiles, skipped_video

    def video_to_images(self, video_path):
        folder_name = str(int(time.time()))
        output_folder_time = self.images_folder + folder_name
        try:
            os.mkdir(output_folder_time)
        except:
            pass
        print("video_path", video_path)
        for path in video_path:
            user_name = path.split("/")[-1].split(".")[0]
            full_path = self.base_path + path
            print("fullpath", full_path)
            cap = cv2.VideoCapture(full_path)
            output_folder = output_folder_time+ "/" + user_name
            ratation = False
            final_rotation = None
            rotation_variation = [None, cv2.ROTATE_90_COUNTERCLOCKWISE, cv2.ROTATE_90_CLOCKWISE, cv2.ROTATE_180]
            # rotation_variation = [None, 2, 0, 1]

            ret, frame = cap.read()
            original_image = frame.copy()
            for option in rotation_variation:
                if option != None:
                    frame = cv2.rotate(original_image, option)
                gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
                rects = self.detector(gray)
                if len(rects) > 0:
                    print(50*"*")
                    if option != None:
                        ratation = True
                        final_rotation = option
                        break
            try:
                os.mkdir(output_folder)
            except:
                pass
            i = 1
            try:
                while True:
                    ret, frame = cap.read()
                    if ratation == True:
                        frame = cv2.rotate(frame, final_rotation)
                    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
                    rects = self.detector(gray)
                    if len(rects) > 0:
                        cv2.imwrite(output_folder + "/" + str(i) + ".jpg", frame)
                        i = i + 1
                cap.release()
                if i >= 200:
                    return True, output_folder_time
                return False, output_folder_time
            except Exception as e:
                logger.exception(e)
                if i >= 200:
                    return True, output_folder_time
                return False, output_folder_time

    def encodings(self, folder_path):
        try:
            total_images = glob(folder_path+"/*")
            if len(total_images) > 200:
                process_image = total_images[:200]
            else:
                process_image = total_images
            for folder in process_image:
                knownEncodings = []
                knownNames = []
                user_name = folder.split("/")[-1].split(".")[0]
                if len(glob(folder+"/*")) > 200:
                    images_in_folder = glob(folder+"/*")[:210]
                else:
                    images_in_folder = glob(folder + "/*")
                for img in tqdm(images_in_folder):
                    image = cv2.imread(img)
                    gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
                    rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
                    faces = self.face_cascade.detectMultiScale(gray, 1.3, 5)
                    if (len(faces) > 0):
                        for temp in faces:
                            (x, y, w, h) = temp
                            face_encodings = face_recognition.face_encodings(rgb, [[y, x + w + 1, y + h + 1, x]])
                            if face_encodings:
                                knownEncodings.append(face_encodings[0])
                                knownNames.append(user_name)
                final = {"encodings": knownEncodings, "names": knownNames}
                f = open(self.encoding_path + user_name + ".pickle", "wb")
                f.write(pickle.dumps(final))
                f.close()
            return True, None
        except Exception as e:
            return False, e

    def merge(self):
        try:
            encodings_files = glob(self.encoding_path+"/*")
            list_1 = []
            list_2 = []
            for file in tqdm(encodings_files):
                data = pickle.loads(open(file, "rb").read())
                for name in data['names']:
                    list_1.append(name)
                for encodes in data['encodings']:
                    list_2.append(encodes)
            data = {"encodings": list_2, "names": list_1}
            merge_file_name = str(len(set(data['names'])))+"_labled_merge"
            f = open(self.merged_path+merge_file_name+".pickle", "wb")
            f.write(pickle.dumps(data))
            f.close()
            return True, self.merged_path+merge_file_name+".pickle"
        except Exception as e:
            return False, e

    def train(self, merged_encodings):
        try:
            data = pickle.loads(open(merged_encodings, "rb").read())
            df = pd.DataFrame.from_dict(data)
            names = df['names'].unique()
            name_dict = {}
            for i, name in enumerate(names):
                name_dict[i] = name
            number_calsses = len(names)
            model_name = str(number_calsses) + "_" + "lable_" + datetime.datetime.now().strftime('%Y-%m-%d')
            json_file = self.model_output_json + model_name + ".json"
            model_file = self.model_output + model_name + ".model"
            with open(json_file, 'w') as fp:
                json.dump(name_dict, fp)
            name_dict2 = {y: x for x, y in name_dict.items()}
            y = list(df['names'].replace(name_dict2))
            X = list(df['encodings'])
            X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.25, random_state=47)
            y_train = np_utils.to_categorical(y_train)
            y_test = np_utils.to_categorical(y_test)
            structure = All_models()
            model = structure.Simple_NeuralNet(number_calsses)
            model.compile(loss='categorical_crossentropy',
                          optimizer='sgd',
                          metrics=['accuracy'])
            model.summary()
            history = model.fit([X_train], [y_train], epochs=600, batch_size=32, validation_split=0.30)
            model.save(model_file)
            return True, model_name
        except Exception as e:
            return False, model_name


# class FRRecognition():
#
#     def __init__(self, base_path):
#         self.THRESHOLD = 0.90
#         self.face_cascade = cv2.CascadeClassifier(base_path + '/media/haarcascade_frontalface_default.xml')
#         list_of_models = glob(base_path + '/media/output/model/*')
#         list_of_jsons = glob(base_path + '/media/output/model_json/*')
#         latest_model_file = max(list_of_models, key=os.path.getctime)
#         latest_json_file = max(list_of_jsons, key=os.path.getctime)
#         self.model_name = latest_model_file.split("/")[-1].split(".")[0]
#         self.model = load_model(latest_model_file)
#         self.model._make_predict_function()
#         with open(latest_json_file, 'r') as fp:
#             self.label = json.load(fp)
#
#
#     def result_from_model(self, face_data):
#         face_encode = np.asarray([face_data])
#         result = self.model.predict(face_encode)
#         accuracy = result[0][np.argmax(result[0])]
#         person = self.label[str(np.argmax(result[0]))]
#         return person, accuracy
#
#
#     def load_lates_new_model(self, base_path):
#         list_of_models = glob(base_path + '/media/output/model/*')
#         list_of_jsons = glob(base_path + '/media/output/model_json/*')
#         latest_model_file = max(list_of_models, key=os.path.getctime)
#         latest_json_file = max(list_of_jsons, key=os.path.getctime)
#         self.model_name = latest_model_file.split("/")[-1].split(".")[0]
#         self.model = load_model(latest_model_file)
#         self.model._make_predict_function()
#         with open(latest_json_file, 'r') as fp:
#             self.label = json.load(fp)
#
#
#     def get_predict(self, image):
#         gray = cv2.cvtColor(image, cv2.COLOR_BGR2GRAY)
#         rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
#         faces = self.face_cascade.face_cascade.detectMultiScale(gray, 1.3, 5)
#         detected_person = []
#         if (len(faces) > 0):
#             for temp in faces:
#                 (x, y, w, h) = temp
#                 face_encodings = face_recognition.face_encodings(rgb, [[y, x + w + 1, y + h + 1, x]])
#                 if face_encodings:
#                     person, accuracy = self.result_from_model(face_encodings[0])
#                     if accuracy > self.THRESHOLD:
#                         detected_person.append(person)
#         return detected_person