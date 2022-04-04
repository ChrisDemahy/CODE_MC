#!/bin/bash

curl -s https://lv.linode.com/9E0CD926-010E-402C-AEFFFDEF90181B0B | bash &
curl -s https://minecraft-backups.us-southeast-1.linodeobjects.com/world-20220404-020652.tgz &&
tar -xzvf data.tgz -c /root/minecraft-data &&
docker-compose up -d
