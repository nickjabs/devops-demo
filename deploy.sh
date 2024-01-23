!/bin/bash

# Deployment Script for Pimcore Application

# Pull the latest code from your repository
git pull https://github.com/nickjabs/devops-demo

# Build the Docker image
docker-compose build

# Start the containers
docker-compose up -d

# Print a success message
echo "Pimcore application deployed successfully!"
