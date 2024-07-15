#!/bin/bash

# Determine the deployment directory
DEPLOY_DIR=$(find /opt/codedeploy-agent/deployment-root/ -type d -name 'deployment-archive' | head -n 1)

# Print the deployment directory for debugging
echo "Deployment directory: $DEPLOY_DIR"

# Navigate to the deployment directory
cd "$DEPLOY_DIR" || { echo "Failed to navigate to deployment directory"; exit 1; }

# Print the current directory for debugging
pwd

# Install Node.js and npm
echo "Installing Node.js and npm..."
curl -sL https://rpm.nodesource.com/setup_18.x | bash -
yum install -y nodejs

# Verify installation
node -v
npm -v

# Install dependencies
echo "Installing dependencies..."
npm install
