#!/bin/bash
set -e

APP_DIR="/home/ec2-user/sholate-motors"
LOG_FILE="$APP_DIR/app.log"

echo "==== Starting App ===="
cd $APP_DIR || { echo "ERROR: Cannot cd to $APP_DIR"; exit 1; }

# Ensure log file exists and has proper permissions
if [ ! -f "$LOG_FILE" ]; then
    touch "$LOG_FILE"
fi
chmod 664 "$LOG_FILE"

# Install dependencies
echo "==== Installing dependencies ====" | tee -a "$LOG_FILE"
if ! npm install >> "$LOG_FILE" 2>&1; then
    echo "ERROR: npm install failed. Check $LOG_FILE for details." | tee -a "$LOG_FILE"
    exit 1
fi

# Stop previous Node.js process if running
if pgrep -f "node server.js" > /dev/null; then
    echo "==== Stopping previous Node process ====" | tee -a "$LOG_FILE"
    pkill -f "node server.js"
fi

# Start the app in the background
PORT=${PORT:-3000}
echo "==== Starting server on port $PORT ====" | tee -a "$LOG_FILE"
nohup node server.js >> "$LOG_FILE" 2>&1 &
sleep 2

# Verify if server started
if pgrep -f "node server.js" > /dev/null; then
    echo "==== Server started successfully! Logs: $LOG_FILE" | tee -a "$LOG_FILE"
else
    echo "ERROR: Server failed to start. Check $LOG_FILE for details." | tee -a "$LOG_FILE"
    exit 1
fi
