// server = true
// bootstrap_expect = 3
start_join = ["node_01:8301","node_02:8301","node_03:8301"]
data_dir = "/app/consul/data/node_05"

node_name = "consul-node05"
client_addr = "0.0.0.0"
advertise_addr = "172.21.0.6"
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
