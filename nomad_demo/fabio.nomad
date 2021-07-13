job "fabio" {
  datacenters = ["dc1"]
  // affinity {
  //   attribute = "${attr.kernel.name}"
  //   value     = "darwin"
  //   weight    = 1
  // }

  group "LB" {

    network {
        port "lb" {
          static = 9999
        }
        port "ui" {
          static = 9998
        }
    }

    count = 3

    task "server" {
      driver = "raw_exec"

      config {
        command = "fabio"
        args = [
          "-proxy.strategy=rr",
          "-registry.consul.addr=${attr.unique.network.ip-address	}:8500",
        ]
      }

      artifact{
        source = "https://github.com/fabiolb/fabio/releases/download/v1.5.15/fabio-1.5.15-go1.15.5-${attr.kernel.name}_amd64"
        destination = "local/fabio"
        mode = "file"
      }
    }
  }
}
