#!/bin/bash
set -e

echo "==== Before Install ===="

APP_DIR="/home/ec2-user/sholate-motors"

# Prepare app directory
rm -rf $APP_DIR/*
mkdir -p $APP_DIR
