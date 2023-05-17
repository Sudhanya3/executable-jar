FROM openjdk:8-jre-alpine3.9
COPY target/*.jar /demo.jar
CMD [ "java", "-jar", "/demo.jar" ]