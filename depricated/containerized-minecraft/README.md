# containerized-minecraft
A personal project I started to get some more experience with docker.

#Goals
1) Build a Minecraft server docker container
2) Automate the deployment of this to AWS ECS + Fargate with CloudFormation
3) Automate backups and disaster recovery
4) Scheduled shutdowns to save on costs
5) A web page which allows the end user to turn the server back on
6) Optimize the standup time
  - possibly build the world file into a new docker image every time the server is shutdown.
7) Managment container which copies server files to S3 on a schedule

#Build and Test Instructions
1) Ensure server.jar and your world file zip are in resources
2) docker build -t minecraft .
3) docker run -i -p 25565:25565  -v "$(pwd)"/Minecraft_Server:/Minecraft_Server -t minecraft
4) docker exec -it <container name> /bin/sh
