module "public_web" {
  source = "../modules/ec2"

  instance_name            = "public_web"
  subnet                   = "public"
  instance_security_groups = aws_security_group.public_web.id
  userdata                 = file("./userdata/public_web_userdata.sh")
  ami_name                 = "ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"
  owner_id                 = "099720109477"
}


resource "aws_security_group" "public_web" {
  name   = "public_web"
  vpc_id = module.rvshare_vpc.vpc_id

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
