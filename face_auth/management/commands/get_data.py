import json
from django.core.management.base import BaseCommand
import paho.mqtt.client as mqtt
from face_auth.models import *

class Command(BaseCommand):
    help = 'MQTT Subscriber for lat and long'

    def handle(self, *args, **kwargs):

        def on_connect(client, userdata, flags, rc):
            print("Connected with result code " + str(rc))
            client.subscribe([("topic/temprature", 0),("topic/status", 0)])

        def on_message(client, userdata, msg):
            data = json.loads(msg.payload.decode())
            print("data--->", data)
            data_temp = json.dumps(data)
            print(data, msg.topic)
            if data and "temprature" in msg.topic:
                create = DemoTest(data=data_temp)
                create.save()
        client = mqtt.Client()
        client.connect("134.122.24.68", 1883, 60)
        client.on_connect = on_connect
        client.on_message = on_message
        client.loop_forever()