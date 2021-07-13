job "consul" {
  datacenters = ["dc1"]

  group "discovery" {

    task "server" {
      driver = "raw_exec"

      config {
        command = "consul"
        args = ["agent","-dev"]
      }

      artifact{
        source = "https://releases.hashicorp.com/consul/1.10.0/consul_1.10.0_darwin_amd64.zip"
      }
    }
  }
}
