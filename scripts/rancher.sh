#!/bin/bash

# Add admin user

useradd "$ADMIN_USER"
echo "$ADMIN_USER":"$ADMIN_PASS" | chpasswd

# Install Docker
curl https://releases.rancher.com/install-docker/19.03.sh | sh

#dnf config-manager --add-repo=https://download.docker.com/linux/centos/docker-ce.repo
#dnf install docker-ce --nobest -y
systemctl enable --now docker

usermod -aG docker "$ADMIN_USER"
usermod -aG wheel "$ADMIN_USER"

# Install Conntrack

yum -y install conntrack

# Install Rancher

docker run -d --restart=unless-stopped -p 80:80 -p 443:443 --privileged rancher/rancher
