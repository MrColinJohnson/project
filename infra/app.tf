module "app" {
  source = "../modules/ec2"

  instance_name            = "app"
  subnet                   = "private"
  instance_security_groups = aws_security_group.app.id
  userdata                 = file("./userdata/app_userdata.tpl")
  machine_image            = "ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"
  owner_id                 = "099720109477"
  vpc                      = module.vpc.vpc_id
}

resource "aws_security_group" "app" {
  name   = "app"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port       = 3000
    to_port         = 3000
    protocol        = "tcp"
    security_groups = [aws_security_group.web.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
