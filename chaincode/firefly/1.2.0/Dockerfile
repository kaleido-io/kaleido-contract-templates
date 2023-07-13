FROM golang:1.18

WORKDIR /app
COPY  firefly.go go.mod go.sum ./
COPY chaincode/ ./chaincode/
RUN go mod tidy
RUN go mod vendor
RUN ls -la ./ \
    && GO111MODULE=on GOOS=linux CGO_ENABLED=0 GOARCH=amd64 go build -o firefly.bin firefly.go
