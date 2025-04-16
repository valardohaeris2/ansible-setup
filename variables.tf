variable "region" {
    description = "AWS Region"
    type = string
    default = "us-east-2"
}

variable "shared_credentials_files" {
    description = "Local AWS credentials file"
    type = list(string)
} 

variable "ami" {
    description = "AWS AMI ID"
    type = string
}

variable "key_name" {
    description = "AWS key-pair name to associate w/ the EC2 Instance"
    type = string
}

variable "vpc_security_group_ids" {
    description = "AWS securoty group id to attach to EC2 instance"
    type = list
} 

