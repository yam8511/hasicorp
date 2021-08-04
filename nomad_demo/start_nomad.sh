rm logs/nomad.log | exit 0
nohup nomad agent -config ./nomad/mac/conf/ > logs/nomad.log 2>&1 &
# apt install -y iproute2
# cp /app/nomad_linux /usr/bin/nomad
# cd /app
# nohup nomad agent -config ./nomad/node01/conf > nomad/logs/nomad-node01.log 2>&1 &
# nohup nomad agent -config ./nomad/node02/conf > nomad/logs/nomad-node02.log 2>&1 &
# nohup nomad agent -config ./nomad/node03/conf > nomad/logs/nomad-node03.log 2>&1 &
# nohup nomad agent -config ./nomad/node04/conf > nomad/logs/nomad-node04.log 2>&1 &
# nohup nomad agent -config ./nomad/node05/conf > nomad/logs/nomad-node05.log 2>&1 &
