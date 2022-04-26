#!/bin/bash

# Create the folder that will be mounted by the container
mkdir minecraft-data

# Move in to the folder
cd ./minecraft-data/ 

# Download the most recent archive
curl -O https://minecraft-backups.us-southeast-1.linodeobjects.com/world-20220405-110742.tgz &&

# Extract the archive
tar zxvf world-20220405-110742.tgz &&

# Move out of the folder
cd .. 

# Download the nginx.conf file
#curl -O https://raw.githubusercontent.com/ChrisDemahy/CODE_MC/main/nginx.conf 

# Grab the docker compose file &  Start the service fabric
(curl -O https://raw.githubusercontent.com/ChrisDemahy/CODE_MC/main/docker-compose.yaml && docker-compose up -d )&

touch success

