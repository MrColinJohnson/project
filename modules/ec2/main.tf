resource "aws_instance" "ec2_instance" {
  ami                     = data.aws_ami.ubuntu.id
  instance_type           = "t2.micro"
  disable_api_termination = "false"
  subnet_id               = data.aws_subnet_ids.public.id
  vpc_security_group_ids  = [aws_security_group.public_web.id]

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "20"
    delete_on_termination = "true"
  }

  tags = {
    Name       = var.instance_name
  }

  volume_tags = {
    Name       = var.instance_name
  }

}

variable "instance_name" {
default = "public"

}

#variable "instance_security_groups" {

#}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"]
}

data "aws_subnet_ids" "public" {
  vpc_id = data.aws_vpc.rvshare.id

  tags = {
    Name = "public"
  }
}

data "aws_vpc" "rvshare" {
  filter {
    name   = "tag:Name"
    values = ["rvshare_vpc"]
  }
}

resource "aws_security_group" "public_web" {
  name = "public_web"
  vpc_id = data.aws_vpc.rvshare.id

  ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = [
      "10.0.0.0/8"]
  }

  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = [
      "0.0.0.0/0"]
  }
}
