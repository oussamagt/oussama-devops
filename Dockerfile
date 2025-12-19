FROM eclipse-temurin:17-jdk-alpine AS build
WORKDIR /app
COPY target/*.jar app.jar

FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
COPY target/TP-Projet-2025-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8089
ENV SPRING_DATASOURCE_URL=jdbc:mysql://mysql-service:3306/timesheetdb?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true
ENV SPRING_DATASOURCE_USERNAME=root
ENV SPRING_DATASOURCE_PASSWORD=root
ENTRYPOINT ["java", "-jar", "app.jar"]