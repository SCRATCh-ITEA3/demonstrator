FROM gcc:latest
WORKDIR /tmp/myapp
COPY ./src/helloworld.cpp /tmp/myapp
RUN gcc -o helloworld helloworld.cpp
CMD ["./helloworld"]
