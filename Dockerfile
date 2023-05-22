FROM openjdk:8-jre-alpine3.9
ADD target/*.jar /java-maven.jar
RUN docker version
CMD [ "java", "-jar", "/demo.jar" ]