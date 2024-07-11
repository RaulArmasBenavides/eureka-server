# Utiliza una imagen base de Maven para compilar el proyecto
FROM maven:3.8.4-openjdk-17-slim AS build

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el archivo pom.xml y los archivos de configuración
COPY pom.xml .

# Copia los archivos de la aplicación al directorio de trabajo
COPY src ./src

# Compila el proyecto utilizando Maven
RUN mvn clean package -DskipTests

# Utiliza una imagen base de OpenJDK para ejecutar la aplicación
FROM openjdk:17-jdk-slim

# Establece el directorio de trabajo en /app
WORKDIR /app

# Copia el archivo JAR desde la etapa de compilación
COPY --from=build /app/target/eureka-server-0.0.1-SNAPSHOT.jar eureka-server.jar

# Expone el puerto 8761 para acceder al servidor Eureka
EXPOSE 8761

# Comando para ejecutar la aplicación
ENTRYPOINT ["java", "-jar", "eureka-server.jar"]