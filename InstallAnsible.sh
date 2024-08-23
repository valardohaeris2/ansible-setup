#!/bin/bash
yum install -y ansible
yum install -y python3-pip

# Ansible admin user 
useradd ansibleadmin
echo "changeme" | passwd --stdin ansibleadmin

# Ansible user 
useradd ansibleuser
echo "changeme" | passwd --stdin ansibleuser
# su - ansibleuser

# modify sudoers file 
echo "ansibleadmin ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/ansible
echo "ansibleuser ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/ansible