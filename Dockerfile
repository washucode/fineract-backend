# ---- Stage 1: Build ----
    FROM gradle:8.1.1-jdk17 AS build
    WORKDIR /app
    
    # Copy everything
    COPY . .
    
    # Disable Gradle Daemon to save memory and build the JAR
    RUN ./gradlew bootJar --no-daemon
    
    # ---- Stage 2: Package ----
    FROM openjdk:17-jdk-slim
    WORKDIR /usr/local/fineract
    
    # Copy the JAR from the build stage
    COPY --from=build /app/build/libs/fineract-provider.jar ./fineract-provider.jar
    
    # Expose the port Fineract runs on
    EXPOSE 8443
    
    # Run the application
    ENTRYPOINT ["java", "-jar", "fineract-provider.jar"]
    