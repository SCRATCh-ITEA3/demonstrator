# builder for hello world
FROM alpine:3.11 AS build_gcc
WORKDIR /tmp/myapp
COPY ./src/ /tmp/myapp/
RUN apk update && apk add gcc build-base && gcc -o helloworld helloworld.cpp

# builder for ioxy 
FROM alpine:3.11 AS build_ioxy
WORKDIR /tmp/ioxy
RUN apk update && apk --no-cache add git go && git clone https://github.com/NVISOsecurity/IOXY && cd IOXY/ioxy && go build .

# main container
FROM alpine:3.11
# install IOXY demo dependencies and code
WORKDIR /ioxy
RUN apk --no-cache update && apk --no-cache add python3 nodejs npm musl-dev gcc build-base
RUN pip3 --disable-pip-version-check install paho-mqtt
RUN npm --loglevel=error install aedes 
COPY ./ioxy /ioxy
COPY --from=build_ioxy /tmp/ioxy/IOXY/ioxy/ioxy .

# main app
WORKDIR /app
ENTRYPOINT ["./helloworld"]
RUN apk --no-cache update && apk --no-cache add libgcc
COPY --from=build_gcc /tmp/myapp/ .