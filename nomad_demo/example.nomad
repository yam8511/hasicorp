job "http-echo" {
  datacenters = ["dc1"]

  group "example" {

    network {
      // mbits = 10 // Deprecated
      port "http" { // empty means dynamic port
        // static = 8080
      }
    }

    update {
      canary = 1
      max_parallel = 5
    }

    count = 5

    task "server" {
      driver = "docker"

      config {
        image = "hashicorp/http-echo"
        ports = ["http"]
        args = [
          "-listen", ":${NOMAD_PORT_http}",
          "-text", "Update Success! Hello and welcome to ${NOMAD_IP_http}:${NOMAD_PORT_http}",
        ]
      }

      resources {
        cpu    = 200
        memory = 10
        // network {
        //   mbits = 10
        //   port "http" {
        //     static = 8080
        //   }
        // }
      }

      service { // 服務發現設定
        name = "my-http-echo-server"
        port = "http"

        tags = [
          "urlprefix-/http-echo",
        ]

        check {
          type = "http"
          path = "/health"
          interval = "2s"
          timeout = "2s"
        }
      }
    }
  }
}
