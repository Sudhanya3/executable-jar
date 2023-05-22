# docker build --progress=plain --no-cache -t myjenkins-blackocean .
FROM  maven:3.9.0-eclipse-temurin-11
RUN cat /etc/*rel*
RUN which docker
#RUN yum install docker -y
EXPOSE 8080