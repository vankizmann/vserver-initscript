#!/bin/bash

# Add user
useradd teamspeak
mkdir /home/teamspeak
chown -R teamspeak /home/teamspeak

# Download Teamspeak Server
wget http://dl.4players.de/ts/releases/3.0.11.2/teamspeak3-server_linux-amd64-3.0.11.2.tar.gz > /dev/null

# Extract Teamspeak Server
tar -xvzf teamspeak3-server_linux-amd64-3.0.11.2.tar.gz -C /home/teamspeak > /dev/null

# Run Teamspeak and get log
sh /home/teamspeak/teamspeak3-server_linux-amd64/ts3server_minimal_runscript.sh > /home/teamspeak/teamspeak.log &

# Link Teamspeak Startscript
ln teamspeak/teamspeak /etc/init.d/teamspeak
chmod 755 /etc/init.d/teamspeak