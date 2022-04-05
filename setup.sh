#!/bin/bash

# Install Linode Longview
curl -s https://lv.linode.com/B10B7A1D-E582-444D-A97618B5CDF4F092 | bash &&

# Create the folder that will be mounted by the container
mkdir minecraft-data

# Move in to the folder
cd ./minecraft-data/ 

# Download the most recent archive
curl -O https://minecraft-backups.us-southeast-1.linodeobjects.com/world-20220404-020652.tgz &&

# Extract the archive
tar zxvf world-20220404-020652.tgz &&
cd .. 

# Raise the Service Fabric
(SLEEP 30 && docker-compose up)
