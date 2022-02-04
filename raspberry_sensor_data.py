#!/usr/bin/env python
from sense_hat import SenseHat
import time
from statsd import StatsClient
sense = SenseHat()

client = StatsClient(host="X", port=X)
while True:
    t = sense.get_temperature()
    p = sense.get_pressure()
    h = sense.get_humidity()

    t = round(t, 1)
    p = round(p, 1)
    h = round(h, 1)

    msg = "Temperature = {0}, Pressure = {1}, Humidity = {2}".format(t,p,h)
    
    client.gauge("MQTT TOPIC_temperature", t)
    client.gauge("MQTT TOPIC_pressure", p)
    client.gauge("MQTT TOPIC_humidity", h)
    print (msg)
    time.sleep(15)
