#!/bin/bash
echo "PID: $$"

DIR="myubuntu:Desktop"
EXCLUDES="--exclude node_modules/** --exclude venv/**"

while [inotifywait -m -r -e create -e modify -e delete $DIR ]
do 
  echo "Syncing..."
  CMD=sudo rclone sync --stats 2s . $DIR --exclude node_modules/** --exclude venv/** -v 
done
