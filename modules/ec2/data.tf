data "aws_ami" "ami_lookup" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.machine_image]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = [var.owner_id]
}

data "aws_subnet_ids" "subnet_lookup" {
  vpc_id = data.aws_vpc.vpc.id

  tags = {
    Name = var.subnet
  }
}

data "aws_vpc" "vpc" {
  id = var.vpc
}


data "template_file" "userdata" {
  template = var.userdata
}
