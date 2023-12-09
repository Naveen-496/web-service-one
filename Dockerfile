FROM openjdk:21-jdk-alpine

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file into the container
COPY target/web-service-one.jar /app/app.jar

# Expose the port that your Spring Boot application will run on
EXPOSE 8080

# Specify the command to run your Spring Boot application
CMD ["java", "-jar", "app.jar"]
