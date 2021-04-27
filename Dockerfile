FROM golang:1.12.0-alpine3.9 as builder

RUN mkdir /app
ADD . /app

WORKDIR /app
RUN go build -o main .

#######################

FROM scratch
WORKDIR /app
COPY --from=builder /app .
CMD ["/app/main"]