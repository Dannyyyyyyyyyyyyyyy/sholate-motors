#!/bin/bash
set -e

APP_DIR="/home/ec2-user/sholate-motors"
LOG_FILE="$APP_DIR/app.log"

echo "==== Starting App ===="

# Ensure app directory exists
mkdir -p "$APP_DIR"

# Create log file if missing and set proper permissions
if [ ! -f "$LOG_FILE" ]; then
    touch "$LOG_FILE"
fi
chmod 664 "$LOG_FILE"
chown ec2-user:ec2-user "$LOG_FILE"

cd "$APP_DIR"

# Optional: Clean node_modules and lock file for fresh install
# rm -rf node_modules package-lock.json

echo "Installing dependencies..." | tee -a "$LOG_FILE"
npm install >> "$LOG_FILE" 2>&1

# Stop previous node process if running
if pgrep -f "node server.js" > /dev/null; then
    echo "Stopping existing Node process..." | tee -a "$LOG_FILE"
    pkill -f "node server.js"
fi

# Start server in background with nohup
echo "Starting server..." | tee -a "$LOG_FILE"
nohup node server.js >> "$LOG_FILE" 2>&1 &
disown

echo "Server started successfully." | tee -a "$LOG_FILE"
