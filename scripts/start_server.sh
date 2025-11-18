#!/bin/bash
set -e

LOG_FILE="/tmp/start_app.log"
APP_DIR="/home/ec2-user/sholate-motors"

echo "==== Starting App ====" | tee -a $LOG_FILE
cd $APP_DIR || { echo "App directory $APP_DIR not found" | tee -a $LOG_FILE; exit 1; }

# Install dependencies
echo "Installing npm dependencies..." | tee -a $LOG_FILE
npm install >> $LOG_FILE 2>&1

# Stop any running instance
if pgrep -f "node server.js" > /dev/null; then
    echo "Stopping previous Node process..." | tee -a $LOG_FILE
    pkill -f "node server.js"
fi

# Start the app in background
PORT=${PORT:-3000}
echo "Starting server on port $PORT..." | tee -a $LOG_FILE
nohup node server.js >> $LOG_FILE 2>&1 &

echo "Server started! Logs: $LOG_FILE" | tee -a $LOG_FILE
