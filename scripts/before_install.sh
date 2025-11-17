#!/bin/bash
set -e

echo "==== Before Install: Starting ===="

# Install Node.js >=18
curl -fsSL https://rpm.nodesource.com/setup_20.x | sudo bash -
sudo yum install -y nodejs

echo "Node version: $(node -v)"
echo "NPM version: $(npm -v)"

# Deployment directory (no extra folder)
DEPLOYMENT_DIR="/opt/codedeploy-agent/deployment-root/$DEPLOYMENT_GROUP_ID/$DEPLOYMENT_ID/deployment-archive"

cd "$DEPLOYMENT_DIR" || { echo "Deployment directory $DEPLOYMENT_DIR does not exist"; exit 1; }

# Install npm dependencies
sudo npm install --unsafe-perm

echo "==== Before Install: Completed ===="
