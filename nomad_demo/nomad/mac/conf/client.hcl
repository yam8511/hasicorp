name = "mac-node"
data_dir = "/Users/yam8511_li/zero/hashicrop/nomad_demo/nomad/mac/data/"

bind_addr = "192.168.33.1"
advertise {
  # Defaults to the first private IP address.
  http = "192.168.33.1"
  rpc  = "192.168.33.1"
  serf = "192.168.33.1"
}

log_level = "INFO"
log_file = "/Users/yam8511_li/zero/hashicrop/nomad_demo/nomad/mac/logs/"
log_rotate_duration = "24h"
log_rotate_max_files = 0

client {
  enabled = true
  network_interface = "vboxnet0"
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
