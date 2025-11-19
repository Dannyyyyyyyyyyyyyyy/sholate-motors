#!/bin/bash
set -e

TARGET_DIR="/home/ec2-user/sholate-motors"

# === Clean old deployment files ===
sudo rm -rf "$TARGET_DIR"/*
sudo mkdir -p "$TARGET_DIR"
sudo chown ec2-user:ec2-user "$TARGET_DIR" -R

LOG_FILE="/tmp/before_install.log"
APP_DIR="$TARGET_DIR"

echo "==== Before Install: Starting ====" | tee -a "$LOG_FILE"

# Check Node.js version >= 18, install if missing
if ! command -v node >/dev/null 2>&1 || [[ $(node -v | cut -d'v' -f2 | cut -d. -f1) -lt 18 ]]; then
    echo "Installing Node.js 20..." | tee -a "$LOG_FILE"
    curl -fsSL https://rpm.nodesource.com/setup_20.x | sudo bash - >> "$LOG_FILE" 2>&1
    sudo yum install -y nodejs >> "$LOG_FILE" 2>&1
else
    echo "Node.js already installed: $(node -v)" | tee -a "$LOG_FILE"
fi

echo "NPM version: $(npm -v)" | tee -a "$LOG_FILE"

# Make sure app directory exists
mkdir -p "$APP_DIR"

echo "==== Before Install: Completed ====" | tee -a "$LOG_FILE"
