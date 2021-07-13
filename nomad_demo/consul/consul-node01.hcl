server = true
bootstrap_expect = 3
start_join = ["192.168.33.1:8301","192.168.33.11:8301","192.168.33.12:8301"]
data_dir = "/home/vagrant/consul/data"

node_name = "consul-node01"
client_addr = "0.0.0.0"
advertise_addr = "192.168.33.11"
bind_addr = "0.0.0.0"
// client_addr    = 外部連線consul的IP, e.g. WebUI, HTTP, default = 127.0.0.1
// advertise_addr = 內部連線consul向外顯現的IP
// bind_addr      = 內部連線consul綁定的IP

connect {
  // agent允許被連線
  enabled = true
}

ui_config {
  enabled = true
}
