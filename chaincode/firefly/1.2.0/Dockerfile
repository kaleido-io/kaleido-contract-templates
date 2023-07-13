FROM golang:1.20

WORKDIR /app
COPY  firefly.go go.mod go.sum ./
COPY chaincode/ ./chaincode/
RUN go mod tidy
RUN GO111MODULE=on GOOS=linux CGO_ENABLED=0 go build -o firefly.bin firefly.go
RUN GO111MODULE=on GOOS=linux CGO_ENABLED=0 go build -o chaincode-go.bin chaincode/contract.go
