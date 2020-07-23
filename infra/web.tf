module "web" {
  source = "../modules/ec2"

  instance_name            = "web"
  subnet                   = "public"
  instance_security_groups = aws_security_group.web.id
  userdata                 = file("./userdata/web_userdata.tpl")
  machine_image            = "ubuntu/images/hvm-ssd/ubuntu-trusty-14.04-amd64-server-*"
  owner_id                 = "099720109477"
  vpc                      = module.vpc.vpc_id
}


resource "aws_security_group" "web" {
  name   = "web"
  vpc_id = module.vpc.vpc_id

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
