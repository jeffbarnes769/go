FROM golang:1.8
RUN mkdir -p /hello
WORKDIR /hello
ADD . /hello
RUN go build ./hello.go
CMD ./hello