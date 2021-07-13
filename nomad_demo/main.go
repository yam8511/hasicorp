package main

import (
	"encoding/json"
	"flag"
	"fmt"
	"net/http"
	"os"
	"strings"
)

func main() {
	addr := flag.String("listen", ":3000", "Server listen address")
	flag.Parse()

	http.HandleFunc("/", func(rw http.ResponseWriter, r *http.Request) {
		msg := "Hello ~ You're from " + r.RemoteAddr + ", serving by " + *addr
		fmt.Println(msg)
		rw.Write([]byte(msg))
	})

	http.HandleFunc("/env", func(rw http.ResponseWriter, r *http.Request) {
		env := map[string]string{}
		for _, v := range os.Environ() {
			vv := strings.Split(v, "=")
			if len(vv) > 1 {
				env[vv[0]] = strings.Join(vv[1:], "=")
			}
		}
		b, _ := json.Marshal(env)
		rw.Header().Set("Content-Type", "application/json")
		rw.Write(b)
	})

	http.HandleFunc("/health", func(rw http.ResponseWriter, r *http.Request) {
		rw.WriteHeader(http.StatusOK)
	})

	fmt.Println("Listening .. ", *addr)
	http.ListenAndServe(*addr, nil)
}
