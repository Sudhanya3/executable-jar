#
# Build Stage
#
FROM maven:3.9.1-eclipse-temurin-11 AS maven
COPY pom.xml /home/app/
COPY src /home/app/src
RUN mvn -f /home/app/pom.xml clean package

#
# Package Stage
#
FROM openjdk:20-ea-jdk-oraclelinux7
WORKDIR /adevguide
COPY --from=maven /home/app/target/*.jar /usr/local/lib/demo.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/usr/local/lib/demo.jar"]
