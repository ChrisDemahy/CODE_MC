#!/bin/bash

# Install Linode Longview
curl -s https://lv.linode.com/B650CB0D-5D60-435F-9B7F9216597C23EB | bash &&

# Create the plugins folder
mkdir plugins 

# Move in to the folder
cd ./plugins/

# Essentials X
curl -O https://ci.ender.zone/job/EssentialsX/lastSuccessfulBuild/artifact/jars/EssentialsX-2.20.0-dev+5-d891268.jar &&

# Geyser
curl -O https://ci.opencollab.dev//job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/spigot/target/Geyser-Spigot.jar &&

# Floodgate
curl -O https://ci.opencollab.dev/job/GeyserMC/job/Floodgate/job/master/lastSuccessfulBuild/artifact/spigot/target/floodgate-spigot.jar &&

# Move out of the folder
cd .. 

# Create the folder that will be mounted by the container
mkdir minecraft-data

# Move in to the folder
cd ./minecraft-data/ 

# Download the most recent archive
curl -O https://minecraft-backups.us-southeast-1.linodeobjects.com/world-20220404-020652.tgz &&

# Extract the archive
tar zxvf world-20220404-020652.tgz &&

# Move out of the folder
cd .. 

# Start the service fabric
docker-compose up
