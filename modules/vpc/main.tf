resource "aws_vpc" "main" {
  #cidr_block = "var.vpc_cidr"
  cidr_block = "10.10.0.0/21"

  tags = {
    Name = "${var.env}-${var.project_name}-vpc"
  }
}