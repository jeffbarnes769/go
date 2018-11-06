#Vulnerabilties
#FROM golang:onbuild
#FROM golang
#FROM golang:alpine 
#RUN mkdir -p /hello
#WORKDIR /hello
#ADD . /hello
#RUN go build ./hello.go
#CMD ["./hello"]

# Passes corporate policy for running as non-root.  Contains vulnerabilites and is much too large   
FROM golang:alpine
RUN addgroup -S lusers && adduser -h /home/luser1 -S -G lusers luser1
#FROM golang
#RUN groupadd -r lusers && useradd  -m -r -g lusers luser1  #from golang
USER luser1
RUN mkdir -p /home/luser1/hello
RUN chown -R luser1:lusers /home/luser1/hello
# CMD ["cd /home/luser1/hello"]
WORKDIR /home/luser1/hello
ADD . /home/luser1/hello
RUN go build /home/luser1/hello/hello.go
CMD ["/home/luser1/hello/hello"]

# multi-stage docker build via the Dockerfile reduces image size and vulnerabilities,
#FROM golang:alpine AS build-env
#RUN groupadd -r lusers && useradd -m -r -g lusers luser1
#RUN addgroup -S lusers && adduser -h /home/luser1 -S -G lusers luser1 
#USER luser1
#RUN mkdir -p /home/luser1/hello
#RUN chown -R luser1:lusers /home/luser1/hello
#WORKDIR /home/luser1/hello
#ADD . /home/luser1/hello
#RUN go build /home/luser1/hello/hello.go

#final stage
#FROM alpine
#RUN addgroup -S lusers && adduser -h /home/luser1 -S -G lusers luser1
#USER luser1
#RUN mkdir -p /home/luser1/hello
#RUN chown -R luser1:lusers /home/luser1/hello
#WORKDIR /home/luser1/hello
#COPY --from=build-env /home/luser1/hello /home/luser1/hello  
# RUN cd /home/luser1/hello
#CMD /home/luser1/hello/hello
