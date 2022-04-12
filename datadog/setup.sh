#!/bin/bash

##
# 
# This plugin requires manual intervention via Docker Secrets.
# Two plugins use secrets, dd-agent (datadog api-key) and web (ssl certs/keys for nginx).
# Currently only dd-agent is implemented here
# 
##

# Create the datadog folder
mkdir datadog

# get the service file
curl -O https://raw.githubusercontent.com/ChrisDemahy/CODE_MC/main/datadog/datadog-container-agent.service

# get the script for the service to run
curl -O https://raw.githubusercontent.com/ChrisDemahy/CODE_MC/main/datadog/start-datadog-container.sh

# Put the service file in the right place
cp datadog-container-agent.service /etc/systemd/system/datadog-container-agent.service

# Start the service
service datadog-container-agent start

# get the nginx dockerfile
mkdir web
cd ./web/
curl -O https://raw.githubusercontent.com/ChrisDemahy/CODE_MC/main/datadog/Dockerfile
cd ..

# Move into the folder
cd ./datadog/

# Get the conf.d archive
curl -O https://minecraft.us-southeast-1.linodeobjects.com/conf.d.tar.gz

# Extract the conf.d archive
tar zxvf conf.d.tar.gz &&

# Move out of the folder
cd ..

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
curl -O https://media.forgecdn.net/files/3724/63/Dynmap-3.4-beta-3-spigot.jar

# Move out of the folder
cd .. 

# Create the folder that will be mounted by the container
mkdir minecraft-data

# Move in to the folder
cd ./minecraft-data/ 

# Download the datadog java agent
curl -O https://minecraft.us-southeast-1.linodeobjects.com/dd-java-agent.jar

# Download the most recent archive
curl -O https://minecraft-backups.us-southeast-1.linodeobjects.com/world-20220405-110742.tgz &&

# Extract the archive
tar zxvf world-20220405-110742.tgz &&

# Move out of the folder
cd .. 

# Download the nginx.conf file
curl -O https://raw.githubusercontent.com/ChrisDemahy/CODE_MC/main/nginx.conf 

# Grab the docker compose file &  Start the service fabric
(curl -O https://raw.githubusercontent.com/ChrisDemahy/CODE_MC/main/datadog/docker-compose.yaml && docker-compose up -d )&

touch success

