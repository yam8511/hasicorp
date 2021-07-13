name = "node01"
data_dir = "/home/vagrant/node01/nomad/data/"

bind_addr = "192.168.33.11"
advertise {
  # Defaults to the first private IP address.
  http = "192.168.33.11"
  rpc  = "192.168.33.11"
  serf = "192.168.33.11"
}

log_level = "INFO"
log_file = "/home/vagrant/node01/nomad/logs/"
log_rotate_duration = "24h"
log_rotate_max_files = 0

server {
  enabled          = true
  bootstrap_expect = 3
  # This is the IP address of the first server provisioned
  // server_join {
  //   retry_join = [
  //     "172.20.10.3:4648",
  //     "172.20.10.4:4648",
  //     "172.20.10.5:4648",
  //   ]
  //   retry_interval= "15s"
  // }
}

// client {
//   enabled = true
// }

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
