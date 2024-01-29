#!/bin/bash

# Deployment Script for Pimcore Application using Docker

# Define your Docker Compose file name
DOCKER_COMPOSE_FILE="docker-compose.yml"

# Step 1: Pull the latest code from the repository
git pull

# Step 2: Build the Docker images
docker-compose -f $DOCKER_COMPOSE_FILE build

# Step 3: Start the containers in the background
docker-compose -f $DOCKER_COMPOSE_FILE up -d
