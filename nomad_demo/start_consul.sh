rm logs/consul.log | exit 0
nohup consul agent -config-dir ./consul/conf > logs/consul.log 2>&1 &
