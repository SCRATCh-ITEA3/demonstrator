FROM alpine AS build_gcc
WORKDIR /tmp/myapp
COPY ./src/helloworld.cpp /tmp/myapp
RUN apk add gcc build-base && gcc -o helloworld helloworld.cpp
FROM alpine:latest
WORKDIR /app
COPY --from=build_gcc /tmp/myapp/ .
ENTRYPOINT ["./helloworld"]
