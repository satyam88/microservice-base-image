# syntax=docker/dockerfile:1
FROM eclipse-temurin:21-jre-jammy as base

# Set a non-root user for security
RUN groupadd -r appuser && useradd -r -g appuser appuser

# Install common dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    unzip \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Set work directory
WORKDIR /app

# Set environment variables (common across services)
ENV JAVA_OPTS="-XX:+UseContainerSupport"

# Switch to non-root user
USER appuser

# Default command (can be overridden by child images)
CMD ["java", "-version"]

