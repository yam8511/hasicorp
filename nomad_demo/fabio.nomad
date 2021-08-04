job "fabio" {
  datacenters = ["dc1"]
  // affinity {
  //   attribute = "${attr.kernel.name}"
  //   value     = "darwin"
  //   weight    = 1
  // }

  constraint {
    attribute = "${attr.unique.network.ip-address}"
    value     = "172.21.0.2"
  }

  group "LB" {

    network {
        port "lb" {
          static = 9999
        }
        port "ui" {
          static = 9998
        }
    }

    count = 1

    task "server" {
      driver = "exec"

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
        options {
          checksum = "md5:14c7a02ca95fb00a4f3010eab4e3c0e354a3f4953d2a793cb800332012f42066"
        }
      }
    }
  }
}
