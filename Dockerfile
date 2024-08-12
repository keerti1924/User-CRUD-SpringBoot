FROM maven:3.8.6-jdk-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

FROM openjdk:21-jdk-slim
WORKDIR /app
COPY --from=build /target/spring-crud-mvcproject.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
