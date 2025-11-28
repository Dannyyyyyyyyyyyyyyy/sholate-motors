#!/bin/bash
set -e

echo "==== Starting Node App ===="

APP_DIR="/home/ec2-user/sholate-motors"
cd $APP_DIR

# Install dependencies
npm install

# Start app
nohup node server.js > app.log 2>&1 &

echo "Node app started!"
