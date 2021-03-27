import json
from django.core.management.base import BaseCommand
import paho.mqtt.client as mqtt
import time

class Command(BaseCommand):
    help = 'MQTT Subscriber for lat and long'

    def handle(self, *args, **kwargs):

        data = ["$PKNID,,U00001205,,,*27'\r\n'$PKNDS,160902,A,2301.2967,N,07228.2519,E,000.0,000.0,,,,U00001205,,,*41'\r\n'$PKNSH,2301.2967,N,07228.2519,E,160902,A,U00001205,*61'\r\n'$GPRMC,160902,A,2301.2967,N,07228.2519,E,000.0,000.0,,,*1B'\r\n'$GPGGA,160902,2301.2967,N,07228.2519,E,1,,,,,,,,*5A'\r\n'$GPGLL,2301.2967,N,07228.2519,E,160902,A*2C",
                "xEU00001205U00001500001202"]

        def GetLat(lat):
            degree = int(float(lat) / 100)
            second = float(lat) - degree * 100
            final_let = degree + second / 100
            return final_let

        def GetData(data):
            input_data = data.split('\r\n')
            data_json = {}
            for row in input_data:
                row_list = row.split(",")
                if row_list[0].replace("'", "") == "$PKNID":
                    data_json['device_id'] = row_list[2]
                if row_list[0].replace("'", "") == "$GPGGA":
                    data_json['time'] = row_list[1]
                    data_json['lat'] = GetLat(float(row_list[2]))
                    data_json['long'] = GetLat(float(row_list[4]))
            return data_json

        while True:
            # final_data = GetData(data)
            final_data = "Dhyey Test"
            client = mqtt.Client()
            client.connect("134.122.24.68", 1883, 60)
            client.publish("topic/test", json.dumps(final_data))
            client.disconnect()
            time.sleep(180)