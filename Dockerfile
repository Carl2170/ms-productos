#FROM openjdk:17-jdk-slim
#WORKDIR /app
#COPY target/*.jar app.jar
#EXPOSE 8003
#ENTRYPOINT ["java", "-jar", "app.jar"]
# Fase de construcción
FROM maven:3.9.9-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Fase final: solo copia el .jar generado
FROM openjdk:17-jdk-slim
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
EXPOSE 8003
ENTRYPOINT ["java", "-jar", "app.jar"]