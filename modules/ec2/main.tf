resource "aws_instance" "ec2_instance" {
  ami                     = data.aws_ami.ami_lookup.id
  instance_type           = "t2.micro"
  disable_api_termination = "false"
  subnet_id               = tolist(data.aws_subnet_ids.subnet_lookup.ids)[0]
  vpc_security_group_ids  = [var.instance_security_groups] #here
  user_data               = data.template_file.userdata.id

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

