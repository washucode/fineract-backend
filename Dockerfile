# Use official OpenJDK image
FROM openjdk:17-jdk-slim

# Set environment variables
ENV FINERACT_HOME=/usr/local/fineract
ENV FINERACT_VERSION=latest

# Create app directory
WORKDIR $FINERACT_HOME

# Copy fineract provider jar and dependencies
COPY build/libs/fineract-provider.jar ./fineract-provider.jar

# Expose the port that the app runs on
EXPOSE 8443

# Command to run the application
CMD ["java", "-jar", "fineract-provider.jar"]

