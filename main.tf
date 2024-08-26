terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.64.0"
    }
  }
}

provider "aws" {
  region                   = var.region 
  shared_credentials_files = var.shared_credentials_files
  profile                  = "default"
}

resource "aws_instance" "ansible-controller" {
  ami                         = var.ami
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  source_dest_check = true

  tags = {
    "Name" = "ansible-controller"
  }
  tags_all = {
    "Name" = "ansible-controller"
  }
  user_data = file("./InstallAnsible.sh")



  cpu_options {
    core_count       = 1
    threads_per_core = 1
  }

  private_dns_name_options {
    enable_resource_name_dns_a_record    = true
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }

  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    tags                  = {}
    tags_all              = {}
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }
}

# Configure Ansible managed node(s)

resource "aws_instance" "ansible-managed" {
  ami                         = var.ami
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = var.key_name
  vpc_security_group_ids = var.vpc_security_group_ids
  source_dest_check = true

  tags = {
    "Name" = "ansible-managed"
  }
  tags_all = {
    "Name" = "ansible-managed"
  }
  user_data = file("./InstallAnsible.sh")



#   cpu_options {
#     core_count       = 1
#     threads_per_core = 1
#   }

  private_dns_name_options {
    enable_resource_name_dns_a_record    = true
    enable_resource_name_dns_aaaa_record = false
    hostname_type                        = "ip-name"
  }

  root_block_device {
    delete_on_termination = true
    encrypted             = false
    iops                  = 3000
    tags                  = {}
    tags_all              = {}
    throughput            = 125
    volume_size           = 8
    volume_type           = "gp3"
  }
}
