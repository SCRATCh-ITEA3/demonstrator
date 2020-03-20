FROM alpine:3.11 AS build_gcc
WORKDIR /tmp/myapp
COPY ./src/ /tmp/myapp/
RUN apk update && apk add gcc build-base && gcc -o helloworld helloworld.cpp
FROM alpine:3.11
WORKDIR /app
RUN apk --no-cache update && apk --no-cache add libgcc
COPY --from=build_gcc /tmp/myapp/ .
ENTRYPOINT ["./helloworld"]
