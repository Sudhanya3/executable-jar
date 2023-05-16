FROM eclipse-temurin:11-jdk-alpine as maven
COPY ./pom.xml ./pom.xml
COPY ./src ./src
RUN mvn dependency:go-offline -B
RUN mvn package
FROM openjdk:20-ea-jdk-oraclelinux7
WORKDIR /adevguide
COPY --from=maven target/*.jar ./executable-jar.jar
CMD ["java", "-jar", "./executable-jar.jar"]
