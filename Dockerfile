# Multi-stage build for Professional Online Voting System
FROM maven:3.9.4-eclipse-temurin-17 AS build

# Set working directory
WORKDIR /build

# Copy Maven files for dependency caching
COPY pom.xml /build/
RUN mvn dependency:go-offline -B

# Copy source code and build
COPY src /build/src
RUN mvn clean package -DskipTests -B

# Production stage
FROM eclipse-temurin:17-jre-alpine

# Install required packages
RUN apk add --no-cache \
    fontconfig \
    ttf-dejavu \
    && rm -rf /var/cache/apk/*

# Create non-root user for security
RUN addgroup -g 1001 -S voting && \
    adduser -S voting -u 1001 -G voting

# Set working directory
WORKDIR /app

# Copy application jar
COPY --from=build /build/target/onlinevoting-web-2.0.0.jar app.jar

# Change ownership to non-root user
RUN chown -R voting:voting /app

# Switch to non-root user
USER voting

# Expose port
EXPOSE 8080

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=60s --retries=3 \
    CMD wget --no-verbose --tries=1 --spider http://localhost:8080/voting/actuator/health || exit 1

# Set JVM options for production
ENV JAVA_OPTS="-Xms512m -Xmx1024m -XX:+UseG1GC -XX:+UseContainerSupport -Djava.security.egd=file:/dev/./urandom"

# Run application
ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar /app/app.jar"]
