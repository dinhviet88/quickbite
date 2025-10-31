# ---- build stage ----
FROM maven:3.9-eclipse-temurin-17-alpine AS build

WORKDIR /app
COPY . /app
    
RUN ./mvnw -q -DskipTests package
    
# ---- runtime stage ----
FROM eclipse-temurin:17-jre-alpine
    
WORKDIR /app
COPY --from=build /app/target/gateway-0.0.1-SNAPSHOT.jar /app/app.jar
    
EXPOSE 8080
    
    
ENTRYPOINT ["sh", "-c", "exec java -jar /app/app.jar"]
