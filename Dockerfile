FROM maven:3.8.6-jdk-17 AS build
COPY . .
RUN mvn clean package -DskipTests

FROM openjdk:17-jdk-slim
COPY --from=build /target/spring-crud-mvcproject.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "demo.jar"]
