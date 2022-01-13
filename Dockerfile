FROM golang:1.16-alpine AS build
WORKDIR /
COPY go.* *.go /
RUN go mod download && go build

FROM alpine
WORKDIR /
COPY --from=build ./go-sample-app ./go-sample-app
ENTRYPOINT [ "/go-sample-app" ]

#размер сокращен с 307MB до 12.1MB