#!/bin/bash
set -e

echo "==== Starting App ===="

APP_DIR="/home/ec2-user/sholate-motors"
cd $APP_DIR

# Make sure dependencies are installed
echo "Installing dependencies..."
npm install

# Stop previous instance if running
if pgrep -f "node server.js" > /dev/null; then
    echo "Stopping existing server..."
    pkill -f "node server.js"
fi

# Start the app in the background
echo "Starting server..."
nohup node server.js > $APP_DIR/app.log 2>&1 &

echo "Server started successfully!"
