FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY target/Weather_Today-1.0-SNAPSHOT.jar /app/app.jar
COPY Countries.properties /app/
COPY .env /app/.env
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]
