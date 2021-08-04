// ./gohttp -listen=":5678"
job "daemon" {
    datacenters = ["dc1"]
    type = "system"

    group "api" {
        network {
            port "http" {
                // static = 5678
            }
        }

        update {
            canary = 1
            max_parallel = 1
        }

        // count = 1

        task "init" {
            lifecycle {
                hook = "prestart"
            }

            driver = "exec"
            config {
                command = "echo"
                args = [
                    "prestart",
                    "${attr.kernel.name}"
                ]
            }
        }

        task "server" {
            driver = "exec"

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
                pid_mode = "host"
            }

            artifact{
                // source只能https
                source = "http://deafdc4dffbe.ngrok.io/gohttp"
                destination = "local/gohttp2"
                mode = "file"
                headers {
                    X-Source-Version = "${NOMAD_ALLOC_ID}"
                }
            }

            service {
                name = "gohttp-daemon-server"
                port = "http"
                tags = [
                    "urlprefix-/gohttp-daemon strip=/gohttp-daemon"
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
