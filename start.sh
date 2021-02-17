#!/bin/sh

MAP=$1
SERVER_NAME=$2


#Update Steam and Ark Server
/home/steam/steamcmd/steamcmd.sh +login anonymous +force_install_dir /home/steam/arkserver +app_update 376030 +quit

#Start Ark Server
/home/steam/arkserver/ShooterGame/Binaries/Linux/ShooterGameServer $MAP?listen?SessionName=$SERVER_NAME -server -log