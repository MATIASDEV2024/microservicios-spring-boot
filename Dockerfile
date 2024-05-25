# Usar una imagen base de Maven para construir la aplicación
FROM openjdk:11
WORKDIR /app
RUN mvn clean package -DskipTests

# Usar una imagen base de OpenJDK para ejecutar la aplicación
FROM openjdk:11-jre-slim
WORKDIR /app
ADD  ./target/microservices-demo-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
 