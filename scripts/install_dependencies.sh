#!/bin/bash

# Get the deployment directory path using DEPLOYMENT_ID
DEPLOYMENT_ROOT="/opt/codedeploy-agent/deployment-root/$DEPLOYMENT_ID/deployment-archive"

echo "Deployment directory: $DEPLOYMENT_ROOT"

# Navigate to the deployment directory
cd $DEPLOYMENT_ROOT

# Install npm packages
echo "Installing npm packages..."
npm install --production  # Use --production flag if you don't need development dependencies

# Check if npm packages are installed correctly
if [ $? -ne 0 ]; then
  echo "Error: npm install failed. Exiting..."
  exit 1
fi

# Additional commands if needed, like building or compiling assets
# Example: npm run build

echo "Dependencies installed successfully."

# Ensure proper file permissions if necessary
# Example: chmod +x some_script.sh

# Exit with success
exit 0
