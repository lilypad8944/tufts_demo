#!/bin/bash

# Add my user and give them sudo
# Generate password using perl crypt
# perl -e 'print crypt("Y0urP@55w0rdH3r3", "salt"),"\n"'
useradd -G wheel -m -p GenerateMe lilypad

# Set system hostname
hostnamectl set-hostname node

# Update and add epel-release
dnf update -y
dnf install epel-release -y

# Install needed software
dnf install ansible vim git openssh-server firewalld -y

# Pull needed files
git clone https://github.com/lilypad8944/tufts_demo

# Backup and copy sshd config
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak
cp /tufts_demo/configs/sshd_config /etc/ssh/sshd_config

# Stop SELinux. This was disabled to save time
setenforce 0
cp /etc/sysconfig/selinux /etc/sysconfig/selinux.bak
cp /tufts_demo/configs/selinux /etc/sysconfig/selinux

# Setup our firewall
firewall-cmd --add-service=ssh --permanent

# Start services
systemctl enable --now sshd
systemctl enable --now firewalld