#move to root?
data "aws_ami" "ami_lookup" {
  most_recent = true

  filter {
    name   = "name"
    values = [var.ami_name]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = [var.owner_id]
}

data "aws_subnet_ids" "subnet_lookup" {
  vpc_id = data.aws_vpc.rvshare.id

  tags = {
    Name = var.subnet
  }
}

data "aws_vpc" "rvshare" {
  filter {
    name   = "tag:Name"
    values = ["rvshare_vpc"]
  }
}

data "template_file" "userdata" {
  template = var.userdata
}
