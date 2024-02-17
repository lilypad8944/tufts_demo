#!/bin/bash

# Add my user and give them sudo
# Generate password using perl crypt
# perl -e 'print crypt("Y0urP@55w0rdH3r3", "salt"),"\n"'
useradd -G wheel -m -p GenerateMe lilypad

# Set system hostname
hostnamectl set-hostname demo.lilypad.space

# Update and add epel-release
dnf update -y
dnf install epel-release -y

# Install needed software
dnf install ansible vim git openssh-server firewalld -y

# Pull needed files
git clone https://github.com/lilypad8944/tufts_demo

# Backup and copy sshd config
cp -b /tufts_demo/etc/ssh/sshd_config /etc/ssh/sshd_config

# Stop SELinux. This was disabled to save time
setenforce 0
cp -b /tufts_demo/etc/sysconfig/selinux /etc/sysconfig/selinux

# Backup and copy Ansible files
cp -b /tufts_demo/etc/ansible/hosts /etc/ansible/hosts
mkdir -p /etc/ansible/group_vars
cp -b /tufts_demo/etc/ansible/group_vars/servers /etc/ansible/group_vars/servers

# Setup our firewall
firewall-cmd --add-service=ssh --permanent

# Start services
systemctl enable --now sshd
systemctl enable --now firewalld