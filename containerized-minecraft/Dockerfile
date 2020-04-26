FROM alpine
MAINTAINER Christian.Hart

RUN apk add --update openjdk8-jre-base screen

WORKDIR "/Minecraft_Server"
CMD ["java", "-Xmx8G", "-Xms1G", "-jar", "server.jar"]

#COPY docker-cmd.sh /docker-cmd.sh

#CMD ["/docker-cmd.sh"]

EXPOSE 25565
