# Ansible on AWS

Deploy ansible controller and host nodes on AWS EC2

# Pre-reqs

**Control Node**

- Ansible binary
- Python3
- pip
- RSA key pair for remote ssh into managed Ansible nodes

**Managed Ansible Node(s)**

- Python3
- pip

# Overview

- Deploy 'main.tf' file to create 2 Ansible EC2 instances
-

# Ansible on VMWare

    - Generate ssh key on the iMac terminal
        ○ ssh-keygen -t ed25519 -C "vmware"
        ○ ssh-keygen -t ed25519 -C "ansible"
    - Copy the public key to the VMWare VM
        ○ ssh-copy-id -i ~/.ssh/vmware.pub user-name@0.0.0.0
        ○ ssh-copy-id -i ~/.ssh/ansible.pub user-namer@0.0.0.0
    - Add key to ssh agent
        ○ eval "$(ssh-agent -s)"
        ○ ssh-add -k ~/.ssh/vmware
        ○ ssh-add -k ~/.ssh/ansible
    - ssh into the VMs
        ○ ssh -i ~/.ssh/vmware user-name@0.0.0.0
        ○ ssh -i ~/.ssh/ansible user-name@0.0.0.0
