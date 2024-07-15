#!/bin/bash

# Ensure DEPLOYMENT_ID is set properly in your deployment environment
DEPLOYMENT_ID="d-JMCIQ2P25"

# Get the deployment directory path using DEPLOYMENT_ID
DEPLOYMENT_ROOT="/opt/codedeploy-agent/deployment-root/$DEPLOYMENT_ID/deployment-archive"

echo "Deployment directory: $DEPLOYMENT_ROOT"

# Check if the deployment directory exists
if [ ! -d "$DEPLOYMENT_ROOT" ]; then
  echo "Error: Deployment directory $DEPLOYMENT_ROOT not found. Exiting..."
  exit 1
fi

# Navigate to the deployment directory
cd $DEPLOYMENT_ROOT || exit

# Install npm packages
echo "Installing npm packages..."
npm install --production --omit=dev

# Check if npm packages are installed correctly
if [ $? -ne 0 ]; then
  echo "Error: npm install failed. Exiting..."
  exit 1
fi

echo "Dependencies installed successfully."

# Additional commands if needed, like building or compiling assets
# Example: npm run build

# Ensure proper file permissions if necessary
# Example: chmod +x some_script.sh

# Exit with success
exit 0
