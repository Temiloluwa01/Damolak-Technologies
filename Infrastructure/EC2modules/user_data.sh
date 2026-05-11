#!/bin/bash
set -e

# Log function for debugging
log() {
  echo "[$(date)] $1" >> /var/log/user-data.log
}

log "Starting Docker installation"

# Install Docker using the official install script
curl -fsSL https://get.docker.com | sh

log "Docker installed, starting service"

# Ensure Docker service is running and enabled (with sudo for safety)
sudo systemctl enable docker
sudo systemctl start docker

log "Docker service started"

# Add the ubuntu user to the docker group if it exists
if id -u ubuntu >/dev/null 2>&1; then
  sudo usermod -aG docker ubuntu
  log "Added ubuntu user to docker group"
else
  log "Ubuntu user not found, checking for ec2-user"
  if id -u ec2-user >/dev/null 2>&1; then
    sudo usermod -aG docker ec2-user
    log "Added ec2-user to docker group"
  fi
fi

# Create app folder for deployment
sudo mkdir -p /home/ubuntu/app
sudo chown ubuntu:ubuntu /home/ubuntu/app 2>/dev/null || true

log "App directory created"

# Verify installation
if docker --version; then
  log "Docker installation successful"
else
  log "Docker installation failed"
  exit 1
fi

# Check if docker compose is available
if docker compose version 2>/dev/null; then
  log "Docker Compose available"
else
  log "Docker Compose not available"
fi

log "User data script completed successfully"
