FROM golang AS builder

COPY main.go /go/src/app/main.go

WORKDIR /go/src/app

RUN go build main.go

ENTRYPOINT ["./main"]

FROM scratch

WORKDIR /go/src/app

COPY --from=builder /go/src/app .
ENTRYPOINT ["./main"]

## docker build -t josuesantosm/fullcycle .
## docker run josuesantosm/fullcycle