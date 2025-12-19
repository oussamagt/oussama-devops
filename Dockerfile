# Stage 1: Build (optionnel si le JAR est déjà construit par Jenkins)
FROM openjdk:17-jdk-slim AS build
WORKDIR /app
COPY target/*.jar app.jar

# Stage 2: Runtime
FROM openjdk:17-jdk-slim
WORKDIR /app

# Copier le JAR depuis le stage de build ou directement
COPY target/TP-Projet-2025-0.0.1-SNAPSHOT.jar app.jar

# Exposer le port de l'application Spring Boot
EXPOSE 8089

# Variables d'environnement pour la base de données
ENV SPRING_DATASOURCE_URL=jdbc:mysql://mysql-service:3306/timesheetdb?createDatabaseIfNotExist=true&useSSL=false&allowPublicKeyRetrieval=true
ENV SPRING_DATASOURCE_USERNAME=root
ENV SPRING_DATASOURCE_PASSWORD=root

# Lancer l'application
ENTRYPOINT ["java", "-jar", "app.jar"]