FROM golang:alpine
ENV GIN_MODE=release
ENV PORT=2001

WORKDIR /var/www/sugoku
COPY . .

COPY go.mod .
COPY go.sum .
RUN go mod download

RUN go build main.go

EXPOSE $PORT

ENTRYPOINT ["./main"]

