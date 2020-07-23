module "db_ec2" {
  source = "../modules/ec2"

  instance_name            = "private_db"
  subnet                   = "private"
  instance_security_groups = aws_security_group.private_app.id
  userdata                 = file("./userdata/private_db_userdata.sh")
  ami_name                 = "ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"
  owner_id                 = "099720109477"
}

resource "aws_security_group" "private_db" {
  name   = "private_db"
  vpc_id = module.rvshare_vpc.vpc_id

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    security_groups = [aws_security_group.private_app.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
