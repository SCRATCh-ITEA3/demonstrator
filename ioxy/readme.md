# Quick start

This is a demo of IOXY (an MQTT intercepting proxy), available here: https://github.com/NVISOsecurity/IOXY . 

The setup is as follows (everything runs inside the container): 
* MQTT client: simulates a smart door MQTT client. Publishes MQTT payloads targeting the Broker. The payloads open the door corresponding to the client (in this case Client 1 opens Door 1)
* Broker : runs on localhost:1884
* IOXY : intercepting MQTT proxy, runs on localhost:1885

# Run the demo

1) Build the container (in the main directory):

`docker build .`

This steps will return an ID (ex. f40f178a0d03).

2) Start the container: 

`docker run -it -p 1111:1111 --entrypoint /bin/sh id_from_build`

This command will start the container, give you access to a shell inside it, and expose its 1111 port to your localhost.

3) Inside the container, cd to the "ioxy" folder:

`cd /ioxy`

4) Start IOXY:

`./ioxy gui 1>/dev/null 2>/dev/null &`

You should now be able to access IOXY in your browser, by browsing to localhost:1111. We will configure it in a couple of steps :)

5) Start broker:

`node broker.js &`

You should see output similar to this: 

```
==== Remote Door Controller ====

[+] MQTT broker started and listening on port  1884
```

6) Configure IOXY: 

In your browser, go to the "Settings" tab of IOXY (http://localhost:1111/settings). Configure the following settings: 

* MitM broker setup: mqtt and then localhost - 1885
* Remote broker: mqtt and then localhost - 1884 

Select "Apply" and then "Start". 

Now, browse to the "App" tab. You can clear the console if you want.

7) Fire the MQTT client (from inside Docker container): 

`python3 client.py 1>/dev/null 2>/dev/null &`

You should see the following output from the broker, inside the console: 

```
/ioxy # [!] Command received! Opening Door 1

```

Then, check the data inside IOXY. You should be able to see the MQTT topic and payload the client published. 

8) On the IOXY GUI, use the slider next to "Intercepting packets" to enable packet interception. 

From inside the docker container, fire the MQTT client one more: 

`python3 client.py 1>/dev/null 2>/dev/null &`

Check inside IOXY. The message should be intercepted and frozen, giving you the opportunity to change the topic and/or payload. Go ahead and modify "controller1" inside the MQTT topic field to "controller2". 

Then, select "Forward" to send the packet to the legitimate broker. 

Check the output of your broker inside the container. You should now see: 

```
/ioxy # [!] Command received! Opening Door 2
```

The door has been hacked :)
