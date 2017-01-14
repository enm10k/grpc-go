FROM golang:1.7-alpine

MAINTAINER enm10k <enm10k@gmail.com>

ADD . /go/src/google.golang.org/grpc
WORKDIR /go/src/google.golang.org/grpc
RUN apk add --update --no-cache git && \
    go get github.com/golang/protobuf/proto && \
    go get golang.org/x/net/context && \
    go get golang.org/x/text && \
    go install google.golang.org/grpc/examples/helloworld/greeter_server

ENTRYPOINT /go/bin/greeter_server

EXPOSE 50051