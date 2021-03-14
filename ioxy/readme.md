# Setup 

docker build .

docker run -it -p 1111:1111 --entrypoint /bin/sh id_from_build

cd /ioxy 

// start IOXY 

./ioxy gui 1>/dev/null 2>/dev/null &

// start broker 

node broker.js &


// fire client 

python3 client.py 1>/dev/null 2>/dev/null &

On host, browse to http://localhost:1111

Settings -> MQTT broker localhost:1885, remote broker localhost:1884


# Schema 

Broker : localhost:1884
IOXY : localhost:1885

Client -> connects to IOXY