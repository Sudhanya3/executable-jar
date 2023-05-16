FROM openjdk:8-jre-alpine3.9
COPY target/executable-jar-0.8.10-SNAPSHOT.jar /demo.jar
CMD [ "java", "-jar", "/demo.jar" ]