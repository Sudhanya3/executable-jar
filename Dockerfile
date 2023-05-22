FROM openjdk:8-jre-alpine3.9
COPY target/*.jar /demo.jar
RUN docker version
CMD [ "java", "-jar", "/demo.jar" ]