import paho.mqtt.client as paho

broker="0.0.0.0"
port=1885

def on_connect(client, userdata, flags, rc):
    print("[+] Connected to MQTT broker with result code: "+str(rc))
    print("[+] Sending comand to open Door 1 ...")
    ret= client1.publish("actions/controller1/unlockDoor","true")

def on_publish(client,userdata,result):
    print("[+] Command sent! Disconnecting and quitting... \n")
    # disconnect
    client1.disconnect()

print()
print("==== MQTT Door 1 Controller Demo ====")
print()

client1= paho.Client("controller1")
client1.on_publish = on_publish
client1.on_connect = on_connect
client1.connect(broker,port)
client1.loop_forever()
