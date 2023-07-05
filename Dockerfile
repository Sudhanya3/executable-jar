FROM openjdk:8-jre-alpine3.9
ADD target/*.jar /java-maven.jar
ENTRYPOINT [ "java", "-jar", "/java-maven.jar" ]
EXPOSE 8080