#!/bin/bash
curl -s https://lv.linode.com/9042CEB9-BE94-48E9-B944B78B6DFCA373 | sudo bash &&
curl -O https://minecraft-backups.us-southeast-1.linodeobjects.com/world-20220404-020652.tgz &&
tar -xzvf world-20220404-020652.tgz -c /root/minecraft-data &&
docker-compose up -d
