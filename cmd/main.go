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
