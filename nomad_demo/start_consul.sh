rm logs/consul.log | exit 0
nohup consul agent -config-dir ./consul/conf > logs/consul.log 2>&1 &
# cp /app/consul_linux /usr/bin/consul
# apt update && apt install net-tools
# cd /app
# nohup consul agent --config-file ./consul/consul-node01.hcl > consul/logs/consul-node01.log 2>&1 &
# nohup consul agent --config-file ./consul/consul-node02.hcl > consul/logs/consul-node02.log 2>&1 &
# nohup consul agent --config-file ./consul/consul-node03.hcl > consul/logs/consul-node03.log 2>&1 &
# nohup consul agent --config-file ./consul/consul-node04.hcl > consul/logs/consul-node04.log 2>&1 &
# nohup consul agent --config-file ./consul/consul-node05.hcl > consul/logs/consul-node05.log 2>&1 &
