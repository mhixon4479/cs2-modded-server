#!/usr/bin/env bash

sudo cp -f /home/steam/cs2/game/csgo/cfg/MatchZy/savednades.json /home/steam/cs2/custom_files/cfg/MatchZy/savednades.json

ps -ef | grep install.sh | awk '{print $2}' | xargs kill -9 $1
ps -ef | grep install.log | awk '{print $2}' | xargs kill -9 $1
ps -ef | grep gcp.sh | awk '{print $2}' | xargs kill -9 $1
ps -ef | grep "python3 -m http.server 80" | awk '{print $2}' | xargs kill -9 $1
ps -ef | grep cs2 | awk '{print $2}' | xargs kill -9 $1
ps -ef | grep SCREEN | awk '{print $2}' | xargs kill -9 $1
