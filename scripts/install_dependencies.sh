#!/bin/bash

# Load NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# Ensure npm is in the PATH
export PATH=$NVM_DIR/versions/node/v18.20.4/bin:$PATH

# Determine the deployment directory
DEPLOY_DIR=$(find /opt/codedeploy-agent/deployment-root/ -type d -name 'deployment-archive' | head -n 1)

# Print the deployment directory for debugging
echo "Deployment directory: $DEPLOY_DIR"

# Navigate to the deployment directory
cd "$DEPLOY_DIR" || { echo "Failed to navigate to deployment directory"; exit 1; }

# Print the current directory for debugging
pwd

# Install dependencies
npm install

