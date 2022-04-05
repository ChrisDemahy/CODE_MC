#!/bin/bash

# Install Linode Longview
curl -s https://lv.linode.com/E60B6B1B-E168-4097-98A795D35AC47216 | bash 

# Download the most recent archive
curl -O https://minecraft-backups.us-southeast-1.linodeobjects.com/world-20220404-020652.tgz

# Create the folder that will be mounted by the container
mkdir minecraft-data

# Move it to the folder
mv ./world-20220404-020652.tgz ./minecraft-data/world-20220404-020652.tgz 
cd ./minecraft-data/ 

# Extract the archive
tar zxvf world-20220404-020652.tgz 
cd .. 

# Get the docker compose file
curl -O https://raw.githubusercontent.com/ChrisDemahy/CODE_MC/main/docker-compose.yaml

# Raise the Service Fabric
docker-compose up
