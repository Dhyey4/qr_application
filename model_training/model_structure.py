from keras.layers import Dense, concatenate,BatchNormalization,Input,MaxPooling2D,ZeroPadding2D,Convolution2D,Dropout,Flatten
from keras.models import Sequential, Model


class All_models():

    def Simple_NeuralNet(self,number_classes):
        model = Sequential()
        model.add(Dense(units=256, activation='relu', input_dim=128))
        model.add(BatchNormalization())
        model.add(Dense(units=1024, activation='relu'))
        model.add(Dropout(0.5))
        model.add(Dense(units=512, activation='relu'))
        model.add(BatchNormalization())
        model.add(Dense(units=number_classes, activation='softmax'))
        return model

    def Try1(self, number_classes):
        encoding = Input(shape=(128,))
        elayer_1 = Dense(units=256, activation='relu')(encoding)
        elayer_2 = BatchNormalization()(elayer_1)
        elayer_3 = Dense(units=1024, activation='relu')(elayer_2)
        elayer_4 = Dropout(0.5)(elayer_3)
        elayer_5 = Dense(units=512, activation='relu')(elayer_4)
        elayer_6 = BatchNormalization()(elayer_5)
        merge = concatenate([elayer_6, encoding])
        hidden1 = Dense(256, activation='relu')(merge)
        hidden2 = Dense(128, activation='relu')(hidden1)
        new_layer = concatenate([hidden2,elayer_2])
        hidden3 = Dense(64,activation='relu')(new_layer)
        hidden4 = Dense(32,activation='sigmoid')(hidden3)
        output = Dense(number_classes, activation='softmax')(hidden4)
        model = Model(inputs=[encoding], outputs=output)
        return model


class Functional_Models:

    def Multiple_Input(self,number_classes):
        # CNN Image Input
        input_layer = Input(shape=(400,400,1))
        layer_1 = ZeroPadding2D((1, 1))(input_layer)
        layer_2 = Convolution2D(64, (3, 3), activation='relu')(layer_1)
        layer_3 = ZeroPadding2D((1, 1))(layer_2)
        layer_4 = Convolution2D(64, (3, 3), activation='relu')(layer_3)
        layer_5 = MaxPooling2D((2, 2), strides=(2, 2))(layer_4)
        layer_6 = ZeroPadding2D((1, 1))(layer_5)
        layer_7 = Convolution2D(128, (3, 3), activation='relu')(layer_6)
        layer_8 = ZeroPadding2D((1, 1))(layer_7)
        layer_9 = Convolution2D(128, (3, 3), activation='relu')(layer_8)
        layer_10 = MaxPooling2D((2, 2), strides=(2, 2))(layer_9)
        layer_11 = ZeroPadding2D((1, 1))(layer_10)
        layer_12 = Convolution2D(256, (3, 3), activation='relu')(layer_11)
        layer_13 = ZeroPadding2D((1, 1))(layer_12)
        layer_14 = Convolution2D(256, (3, 3), activation='relu')(layer_13)
        layer_15 = ZeroPadding2D((1, 1))(layer_14)
        layer_16 = Convolution2D(256, (3, 3), activation='relu')(layer_15)
        layer_17 = MaxPooling2D((2, 2), strides=(2, 2))(layer_16)
        flat1 = Flatten()(layer_17)

        # Encoding Input
        encoding = Input(shape=(1,128))
        elayer_1 = Dense(units=256, activation='relu', input_dim=128)(encoding)
        elayer_2 = BatchNormalization()(elayer_1)
        elayer_3 = Dense(units=1024, activation='relu')(elayer_2)
        elayer_4 = Dropout(0.5)(elayer_3)
        elayer_5 = Dense(units=512, activation='relu')(elayer_4)
        elayer_6 = BatchNormalization()(elayer_5)
        flat2 = Flatten()(elayer_6)

        merge = concatenate([flat1, flat2])

        hidden1 = Dense(256, activation='relu')(merge)
        hidden2 = Dense(128, activation='relu')(hidden1)
        output = Dense(number_classes, activation='sigmoid')(hidden2)
        model = Model(inputs=[input_layer, encoding], outputs=output)
        # return model
        model.summary()
