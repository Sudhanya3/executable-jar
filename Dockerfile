#
# Build Stage
#
FROM eclipse-temurin:11-jdk AS maven
COPY pom.xml /home/app/
COPY src /home/app/src
RUN mvn -f /home/app/pom.xml clean package

#
# Package Stage
#
FROM eclipse-temurin:11
WORKDIR /adevguide
COPY --from=maven /home/app/target/*.jar /usr/local/lib/demo.jar
ENTRYPOINT ["java", "-jar", "/usr/local/lib/demo.jar"]
