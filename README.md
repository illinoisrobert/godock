The code in this directory is derived from this StackOverflow answer:

https://stackoverflow.com/a/76018968/24283578

`Dockerfile:`
```Dockerfile
# Build phase
FROM golang:1.20 AS builder
# Next line is just for debug
RUN ldd --version
WORKDIR /build
COPY go.mod go.sum ./
RUN go mod download && go mod verify
COPY . .
WORKDIR /build/cmd
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o go-binary

# Production phase
FROM alpine:3.14
# Next line is just for debug
RUN ldd; exit 0
WORKDIR /app
COPY --from=builder /build/cmd/go-binary .
ENTRYPOINT [ "/app/go-binary"]
```

`main.go:`
```go
package main

import (
	"os"
	"time"

	"github.com/rs/zerolog/log"
)

func main() {
	yourVar := os.Getenv("YOUR_VAR")
	for {
		time.Sleep(time.Second)
		log.Info().Msg(yourVar)
	}
}
```


Build and run:
```sh
docker build --no-cache -t stack-overflow-go-docker:v1.0 .
docker run --env YOUR_VAR=your-value stack-overflow-go-docker:v1.0
```
```text
{"level":"info","time":"2023-04-14T21:12:37Z","message":"your-value"}
{"level":"info","time":"2023-04-14T21:12:38Z","message":"your-value"}
```
