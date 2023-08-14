#!/bin/bash
DIR="/home/vitor/Desktop"
rclone --config=/home/vitor/.config/rclone/rclone.conf sync "$DIR" myubuntu:Desktop --exclude 'node_modules/**' --exclude 'venv/**'

# To create the service, you need to run sudo -i to run commands as root
# 1. Create the service to keep this file running (cannot run a service where the binary is in a user's home directory, or in our case, the root user's home directory. We need to use /usr/local/bin - https://serverfault.com/questions/957084/failed-at-step-exec-spawning-permission-denied:  
  # [Unit]
  # Description=Auto sync to google drive       

  # [Service]
  # ExecStart=/usr/local/bin/gdrive_sync.sh  

  # [Install]
  # WantedBy=multi-user.target
# 2. Enable the service: sudo systemctl enable gdrive_sync.service
# 3. Start the service: sudo systemctl start gdrive_sync.service
# 4. Check the status of the service: sudo systemctl status gdrive_sync.service