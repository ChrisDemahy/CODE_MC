#!/bin/bash

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

# Dynamap
curl -O https://dev.bukkit.org/projects/dynmap/files/3724063/download

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

# Download the nginx.conf file
curl -O 

# Grab the docker compose file

curl -O https://raw.githubusercontent.com/ChrisDemahy/CODE_MC/main/docker-compose.yaml

# Start the service fabric
docker-compose up
