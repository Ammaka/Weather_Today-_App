
FROM maven:3.9.5-eclipse-temurin-17 AS builder


WORKDIR /app


COPY . .


RUN mvn clean package -DskipTests


FROM eclipse-temurin:17-jre-alpine


WORKDIR /app


COPY --from=builder /app/target/Weather_Today-1.0-SNAPSHOT.jar /app/app.jar


COPY Countries.properties /app/
COPY .env /app/.env


EXPOSE 8080


ENTRYPOINT ["java", "-jar", "app.jar"]