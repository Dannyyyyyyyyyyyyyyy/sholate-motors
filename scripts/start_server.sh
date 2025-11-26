#!/bin/bash
set -e

echo "==== Starting App ===="

APP_DIR="/home/ec2-user/sholate-motors"
cd $APP_DIR

# Stop previous instance if running
if pgrep -f "node server.js" > /dev/null; then
    pkill -f "node server.js"
fi

# Start the app
nohup node server.js > app.log 2>&1 &

echo "Server started!"