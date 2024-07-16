#!/bin/bash

# Define the deployment directory path
DEPLOYMENT_DIR="/opt/codedeploy-agent/deployment-root/$DEPLOYMENT_GROUP_ID/$DEPLOYMENT_ID/deployment-archive"

# Check if the deployment directory exists
if [ ! -d "$DEPLOYMENT_DIR" ]; then
    echo "Deployment directory $DEPLOYMENT_DIR not found. Exiting..."
    exit 1
fi

# Navigate to the deployment directory
cd "$DEPLOYMENT_DIR" || exit 1

# Example: Install npm dependencies
echo "Installing npm packages..."
npm install 

# Start the server (adjust this command based on how you start your server)
echo "Starting the server..."
npm start

# Add more commands as needed for your deployment process
