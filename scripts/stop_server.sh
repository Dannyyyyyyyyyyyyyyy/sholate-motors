#!/bin/bash
set -e

APP_DIR="/home/ec2-user/sholate-motors"
LOG_FILE="$APP_DIR/app.log"

echo "==== Stopping App ===="
cd "$APP_DIR" || { echo "ERROR: Cannot cd to $APP_DIR"; exit 1; }

# Stop node server if running
if pgrep -f "node server.js" > /dev/null; then
    pkill -f "node server.js"
    echo "Server stopped successfully!" | tee -a "$LOG_FILE"
else
    echo "No server process found." | tee -a "$LOG_FILE"
fi
