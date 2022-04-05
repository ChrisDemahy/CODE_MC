#!/bin/bash

# Install Linode Longview
curl -s https://lv.linode.com/AE4B1674-7E2B-4A49-94AC355D25BD1183 | bash &&

# Create the folder that will be mounted by the container
mkdir minecraft-data

# Move in to the folder
cd ./minecraft-data/ 

# Download the most recent archive
curl -O https://minecraft-backups.us-southeast-1.linodeobjects.com/world-20220404-020652.tgz &&

# Extract the archive
tar zxvf world-20220404-020652.tgz &&
cd .. 

# Download the docker-compose
curl -O https://raw.githubusercontent.com/ChrisDemahy/CODE_MC/main/docker-compose.yaml

# Raise the Service Fabric
(SLEEP 30 && docker-compose up)
