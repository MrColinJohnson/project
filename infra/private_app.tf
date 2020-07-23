module "private_ec2" {
  source = "../modules/ec2"

  instance_name            = "private_app"
  subnet                   = "private"
  instance_security_groups = aws_security_group.private_app.id
  userdata                 = file("./userdata/private_app_userdata.sh")
  ami_name                 = "ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"
  owner_id                 = "099720109477"
}

resource "aws_security_group" "private_app" {
  name   = "private_app"
  vpc_id = module.rvshare_vpc.vpc_id

  ingress {
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    security_groups = [aws_security_group.public_web.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
