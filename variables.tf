#variable for all modules
variable "env" {}
variable "project_name" {}
variable "kms_key_id" {}

#variables for each module
#variable "vpc" {}
#variable "rds" {}

variable "vpc_cidr" {}
variable "public_subnets_cidr" {}
variable "web_subnets_cidr" {}
variable "app_subnets_cidr" {}
variable "db_subnets_cidr" {}
variable "az" {}
variable "rds_allocated_storage" {}
variable "rds_dbname" {}
variable "rds_engine" {}
variable "rds_engine_version" {}
variable "rds_instance_class" {}
variable "rds_family" {}
variable "bastion_cidrs" {}


variable "backend_app_port" {}
variable "backend_instance_capacity" {}
variable "backend_instance_type" {}
