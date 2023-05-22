FROM openjdk:8-jre-alpine3.9
ADD target/*.jar /java-maven.jar
ENTRYPOINT [ "java", "-jar", "/executable-jar.jar" ]
EXPOSE 8080