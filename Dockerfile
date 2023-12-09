
# Use the official Maven image as a build stage
FROM maven:3.9.6-openjdk-21 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy only the POM file to leverage Docker cache
COPY pom.xml .

# Download dependencies (this step is separate to leverage Docker cache)
RUN mvn dependency:go-offline -B

# Copy the rest of the application code
COPY src src

# Build the application
RUN mvn clean install -DskipTests

# Use the official OpenJDK runtime as a base image
FROM openjdk:21

# Set the working directory inside the container
WORKDIR /app

# Copy the JAR file from the build stage to the runtime image
COPY --from=build /app/target/web-service-one-0.0.1-SNAPSHOT.jar /app/app.jar

# Expose the port that your Spring Boot application will run on
EXPOSE 8080

# Specify the command to run your Spring Boot application
CMD ["java", "-jar", "app.jar"]
