name = "node05"
data_dir = "/app/nomad/node05/data/"

bind_addr = "0.0.0.0"
advertise {
  # Defaults to the first private IP address.
  http = "node_05"
  rpc  = "node_05"
  serf = "node_05"
}

log_level = "INFO"
log_file = "/app/nomad/node05/logs/"
log_rotate_duration = "24h"
log_rotate_max_files = 0
client {
  enabled = true
  // network_interface = "eth1"
}

plugin "raw_exec" {
  config {
    enabled = true
  }
}

// # You do not need to add this to your configuration file. This is an example
// # that is part of Nomad's internal default configuration for Consul integration.
// consul {
//   # The address to the Consul agent.
//   address = "192.168.33.1:8500"

//   # The service name to register the server and client with Consul.
//   server_service_name = "nomad"
//   client_service_name = "nomad-client"

//   # Enables automatically registering the services.
//   auto_advertise = true

//   # Enabling the server and client to bootstrap using Consul.
//   server_auto_join = true
//   client_auto_join = true
// }
