#!/bin/bash
curl -s https://lv.linode.com/8DF6FD88-AF5F-410D-8C9F8D56BFEB1291 | bash &
curl -O https://minecraft-backups.us-southeast-1.linodeobjects.com/world-20220404-020652.tgz &&
mv ./world-20220404-020652.tgz ./minecraft-data/world-20220404-020652.tgz &&
cd ./minecraft-data/ &&
tar zxvf world-20220404-020652.tgz &&
cd .. &&
docker-compose up -d
