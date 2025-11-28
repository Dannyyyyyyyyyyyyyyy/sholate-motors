#!/bin/bash
set -e

echo "==== Starting Node App ===="

APP_DIR="/home/ec2-user/sholate-motors"
cd $APP_DIR

# Fix ownership and permissions just in case
sudo chown -R ec2-user:ec2-user $APP_DIR
chmod -R 755 $APP_DIR

# Install dependencies with correct permissions
npm install --unsafe-perm

# Start app in background and log output
nohup node server.js > app.log 2>&1 &

echo "Node app started!"
