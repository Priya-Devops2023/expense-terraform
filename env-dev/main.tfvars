env = "dev"
project_name = "expense"
# Specifying the KMS key
kms_key_id = "arn:aws:kms:us-east-1:151681917074:key/a72861e7-d694-44a1-9fb5-46ce6f7efd50"
bastion_cidrs = ["172.31.46.173/32"] # workstation private ip


vpc = {
  main = {
    vpc_cidr = "10.10.0.0/21"
    public_subnets_cidr = ["10.10.0.0/25","10.10.0.128/25"]
    web_subnets_cidr = ["10.10.1.0/25","10.10.1.128/25"]
    app_subnets_cidr = ["10.10.2.0/25","10.10.2.128/25"]
    db_subnets_cidr = ["10.10.3.0/25","10.10.3.128/25"]
    az = ["us-east-1a","us-east-1b"]
  }
}

rds = {
  main = {
    allocated_storage = 10
    db_name           = "expense"
    engine            = "mysql"
    engine_version    = "5.7"
    instance_class    = "db.t3.micro"
    family            = "mysql5.7"

    backend_app_port = 8080
    backend_instance_capacity = 1
    backend_instance_type = "t3.micro"
  }
}

