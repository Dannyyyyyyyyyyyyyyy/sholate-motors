#!/bin/bash
set -e

echo "==== Before Install: Starting ===="

# Install Node.js >= 20 if not already installed
if ! command -v node &> /dev/null || [[ $(node -v) != v2* ]]; then
    echo "Installing Node.js 20.x..."
    curl -fsSL https://rpm.nodesource.com/setup_20.x | sudo bash -
    sudo yum install -y nodejs
else
    echo "Node.js already installed: $(node -v)"
fi

echo "Node version: $(node -v)"
echo "NPM version: $(npm -v)"

# Deployment directory (no extra folder)
DEPLOYMENT_DIR="/opt/codedeploy-agent/deployment-root/$DEPLOYMENT_GROUP_ID/$DEPLOYMENT_ID/deployment-archive"
LOG_FILE="$DEPLOYMENT_DIR/before_install.log"

# Ensure deployment directory exists
cd "$DEPLOYMENT_DIR" || { echo "ERROR: Deployment directory $DEPLOYMENT_DIR does not exist"; exit 1; }

# Install npm dependencies
echo "Installing npm dependencies..." | tee -a "$LOG_FILE"
sudo npm install --unsafe-perm >> "$LOG_FILE" 2>&1 || { echo "ERROR: npm install failed. Check $LOG_FILE"; exit 1; }

echo "==== Before Install: Completed ===="
