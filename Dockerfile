# Stage 1: Build
FROM gradle:7.6-jdk17 AS build
WORKDIR /app
COPY . .
RUN gradle build

# Stage 2: Run
FROM openjdk:17
WORKDIR /app
COPY --from=build /app/build/libs/*.jar app.jar
CMD ["java", "-jar", "app.jar"]
