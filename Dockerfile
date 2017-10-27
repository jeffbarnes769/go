#FROM golang AS build-env
#RUN mkdir -p /app
#WORKDIR /app
#ADD . /app
#RUN go build ./hello.go

# final stage
#FROM alpine
#WORKDIR /app
#COPY --from=build-env /app /app  
#RUN cd /app
#CMD ./hello

FROM golang:alpine
RUN mkdir -p /hello
WORKDIR /hello
ADD . /hello
RUN go build ./hello.go
CMD ["./hello"]