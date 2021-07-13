// ./gohttp -listen=":5678"
job "gogo" {
    datacenters = ["dc1"]

    group "api" {
        network {
            port "http" {
                // static = 5678
            }
        }

        count = 3

        task "init" {
            lifecycle {
                hook = "prestart"
            }

            driver = "raw_exec"
            config {
                command = "echo"
                args = [
                    "prestart",
                    "${attr.kernel.name}"
                ]
            }
        }

        task "server" {
            driver = "raw_exec"

            env {
                AAA = "aaa"
                BBB = "bbb"
            }

            config {
                command = "gohttp2"
                args = [
                    "-listen",
                    ":${NOMAD_PORT_http}",
                ]
            }

            artifact{
                // source只能https
                source = "https://3c889c065757.ngrok.io/gohttp_${attr.kernel.name}"
                destination = "local/gohttp2"
                mode = "file"
            }

            service {
                name = "gohttp-server"
                port = "http"
                tags = [
                    "urlprefix-/gohttp strip=/gohttp"
                ]

                check {
                    type = "http"
                    path = "/health"
                    interval = "2s"
                    timeout = "2s"
                    failures_before_critical = 3
                }
            }
        }
    }
}
