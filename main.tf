module "vpc" {
  source    = "./modules/vpc"
  for_each  = var.vpc
   #vpc_cidr = each.value["vpc_cidr"]
   vpc_cidr = "10.10.0.0/21"
}