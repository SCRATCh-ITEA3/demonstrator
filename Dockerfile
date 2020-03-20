FROM alpine:3.11 AS build_gcc
WORKDIR /tmp/myapp
COPY ./src/ /tmp/myapp/
RUN apk add gcc build-base && gcc -o helloworld helloworld.cpp
#FROM alpine:3.11
#WORKDIR /app
#COPY --from=build_gcc /tmp/myapp/ .
ENTRYPOINT ["./helloworld"]
