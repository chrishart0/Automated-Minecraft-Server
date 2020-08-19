#!/bin/sh
(while :; do echo 'Hi'; sleep 1; done) &
cd Minecraft_Server
java -Xmx2G -Xms1G -jar server.jar
