#variable for all modules
variable "env" {}
variable "project_name" {}
variable "kms_key_id" {}

#variables for each module
variable "vpc" {}
variable "rds" {}


variable "bastion_cidrs" {}
variable "backend_app_port" {}
variable "backend_instance_capacity" {}
variable "backend_instance_type" {}
variable "web_subnets_cidr" {}