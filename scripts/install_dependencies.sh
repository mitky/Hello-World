#!/bin/bash

# Find the latest deployment directory
LATEST_DEPLOY_DIR=$(ls -dt /opt/codedeploy-agent/deployment-root/6c862eca-1c33-4cdc-9bba-c28bad60fd6b/d-*/deployment-archive | head -n 1)

if [ -z "$LATEST_DEPLOY_DIR" ]; then
    echo "Deployment directory not found. Exiting..."
    exit 1
fi

echo "Deployment directory: $LATEST_DEPLOY_DIR"
cd "$LATEST_DEPLOY_DIR" || exit

# Install all dependencies
echo "Installing npm packages..."
npm install --production

# Build the project
echo "Building the project..."
npm run build

echo "Dependencies installed and project built successfully."

# Navigate to build directory
cd build

# Copy files to Apache document root
sudo cp -r * /var/www/html/

# Set ownership and permissions
sudo chown -R apache:apache /var/www/html/*
sudo chmod -R 755 /var/www/html/*

# Restart Apache to apply changes
sudo systemctl restart httpd
