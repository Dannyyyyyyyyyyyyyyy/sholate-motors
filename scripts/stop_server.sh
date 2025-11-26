#!/bin/bash
set -e

echo "==== Stopping App ===="

# Stop node server
if pgrep -f "node server.js" > /dev/null; then
    pkill -f "node server.js"
    echo "Server stopped!"
else
    echo "No server process found."
fi