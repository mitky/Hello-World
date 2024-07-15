#!/bin/bash

# Capture the deployment ID provided by CodeDeploy
DEPLOYMENT_ID=$DEPLOYMENT_GROUP_ID

# Construct the path to the deployment directory
DEPLOYMENT_DIR="/opt/codedeploy-agent/deployment-root/$DEPLOYMENT_ID/deployment-archive"

# Check if the deployment directory exists
if [ ! -d "$DEPLOYMENT_DIR" ]; then
    echo "Deployment directory $DEPLOYMENT_DIR not found. Exiting..."
    exit 1
fi

# Navigate to the deployment directory
cd "$DEPLOYMENT_DIR" || exit 1  # Exit script if cd fails

# Example: Install dependencies with npm
echo "Installing npm packages..."
npm install

# Example: Run start_server.sh script


# Add more commands as needed for your deployment process
