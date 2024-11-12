FROM golang:alpine3.20 AS builder
WORKDIR /usr/src/app
COPY . .
RUN go build -ldflags="-s -w" full-cycle-rocks.go

# Final Image
FROM scratch
WORKDIR /app
COPY --from=builder /usr/src/app/full-cycle-rocks .
CMD ["./full-cycle-rocks"]
