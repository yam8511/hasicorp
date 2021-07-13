rm logs/nomad.log | exit 0
nohup nomad agent -config ./nomad/mac/conf/ > logs/nomad.log 2>&1 &
