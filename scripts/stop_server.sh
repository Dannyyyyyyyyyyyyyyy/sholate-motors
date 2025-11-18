#!/bin/bash
set -e

LOG_FILE="/tmp/stop_app.log"
echo "==== Stopping App ====" | tee -a $LOG_FILE

if pgrep -f "node server.js" > /dev/null; then
    pkill -f "node server.js"
    echo "Server stopped!" | tee -a $LOG_FILE
else
    echo "No Node process found." | tee -a $LOG_FILE
fi
