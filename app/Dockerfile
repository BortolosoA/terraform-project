FROM golang:tip-alpine3.24 AS builder

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build  -o projeto-korp main.go

FROM scratch

COPY --from=builder /app /app

ENTRYPOINT [ "/app/projeto-korp" ]