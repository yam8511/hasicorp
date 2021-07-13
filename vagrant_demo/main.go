package main

import (
	"log"
	"net/http"
)

func main() {
	http.HandleFunc("/", func(rw http.ResponseWriter, r *http.Request) {
		rw.Write([]byte("Hello Go!"))
	})

	log.Println("Server Starting...")

	log.Fatal(http.ListenAndServe(":80", nil))
}
