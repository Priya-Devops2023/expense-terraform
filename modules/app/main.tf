resource "aws_security_group" "main"{
  name        = "${local.name}-rds-sg"
  description = "${local.name}-rds-sg"
  vpc_id      = var.vpc_id

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = var.bastion_cidrs
    description      = "SSH"
  }

  ingress {
    from_port        = var.app_port
    to_port          = var.app_port
    protocol         = "tcp"
    cidr_blocks      = var.sg_cidr_blocks
    description      = "APPPORT"
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${local.name}-rds-sg"
  }
}

resource "aws_launch_template" "main" {
  name_prefix            = "launch"
  image_id               = data.aws_ami.centos8.image_id
  instance_type          = var.instant_type
  vpc_security_group_ids = [aws_security_group.main.id]
}

resource "aws_autoscaling_group" "main" {
  name                = "${local.name}-asg"
  desired_capacity    = var.instant_capacity
  max_size            = var.instant_capacity # This will fine tune after ASG
  min_size            = var.instant_capacity
  vpc_zone_identifier = var.vpc_zone_identifier

  launch_template {
    id      = aws_launch_template.main.id
    version = "$Latest"
  }
  tag {
    key                 = "Name"
    value               = local.name
    propagate_at_launch = true
  }
}

