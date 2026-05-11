#!/bin/bash
set -e

# Install Docker using the official install script.
# This is the simplest reliable method for most Linux distributions.
curl -fsSL https://get.docker.com | sh

# Ensure Docker service is running and enabled.
systemctl enable docker
systemctl start docker

# Add the ubuntu user to the docker group if it exists.
if id -u ubuntu >/dev/null 2>&1; then
  usermod -aG docker ubuntu || true
fi

# Create app folder for deployment.
mkdir -p /home/ubuntu/app
chown ubuntu:ubuntu /home/ubuntu/app || true

# Verify installation
docker --version
docker compose version || true
