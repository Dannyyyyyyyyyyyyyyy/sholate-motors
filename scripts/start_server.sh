#!/bin/bash
set -e

APP_DIR="/home/ec2-user/sholate-motors"
LOG_FILE="$APP_DIR/app.log"

echo "==== Starting App ===="

# Ensure directory exists
mkdir -p "$APP_DIR"

# Create log file if missing
touch "$LOG_FILE"
chmod 666 "$LOG_FILE"

cd "$APP_DIR"

echo "Installing dependencies..." | tee -a "$LOG_FILE"
npm install >> "$LOG_FILE" 2>&1

# Stop previous node process
if pgrep -f "node server.js" > /dev/null; then
    echo "Stopping existing Node process..." | tee -a "$LOG_FILE"
    pkill -f "node server.js"
fi

# Start server
echo "Starting server..." | tee -a "$LOG_FILE"
nohup node server.js >> "$LOG_FILE" 2>&1 &

echo "Server started successfully." | tee -a "$LOG_FILE"
