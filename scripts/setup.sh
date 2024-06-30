#!/bin/bash

#curl -L https://api.purpurmc.org/v2/purpur/1.20.6/latest/download -o server.jar
#java -Xms512M -Xmx512M -Dcom.mojang.eula.agree=true -jar server.jar nogui

touch banned-ips.json
touch banned-players.json
touch eula.txt
touch ops.json
touch permissions.json
touch usercache.json
touch whitelist.json

echo "# You need to agree to the minecraft EULA in order to run the server. Set eula=true" > eula.txt 
echo "eula=false" >> eula.txt
