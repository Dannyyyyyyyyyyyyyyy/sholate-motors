#!/bin/bash
set -e

APP_DIR="/home/ec2-user/sholate-motors"
LOG_FILE="$APP_DIR/app.log"

echo "==== Starting App ===="
cd $APP_DIR

# Ensure logs are writable by ec2-user
touch $LOG_FILE
chmod 664 $LOG_FILE

# Install dependencies (skip if already installed)
echo "Installing dependencies..."
npm install >> $LOG_FILE 2>&1

# Stop previous instance if running
if pgrep -f "node server.js" > /dev/null; then
    echo "Stopping previous Node process..."
    pkill -f "node server.js"
fi

# Start the app in background on PORT from env or 3000
PORT=${PORT:-3000}
echo "Starting server on port $PORT..."
nohup node server.js >> $LOG_FILE 2>&1 &

echo "Server started! Logs: $LOG_FILE"

