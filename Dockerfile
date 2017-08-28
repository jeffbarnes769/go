FROM golang
RUN mkdir -p /hello
WORKDIR /hello
ADD . /hello
RUN go build ./hello.go
CMD ./hello