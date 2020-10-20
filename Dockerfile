FROM golang:alpine as golang   

RUN mkdir -p /root/helloworld
RUN mkdir -p /root/helloworld/output
COPY ./ /root/helloworld

WORKDIR /root/helloworld
RUN go build -o output/main ./


FROM alpine as alpine

RUN mkdir -p /root/helloworld
COPY --from=golang --chown=root:root /root/helloworld/output /root/helloworld

CMD /root/helloworld/main
