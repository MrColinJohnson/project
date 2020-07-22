resource "aws_vpc" "rvshare_vpc" {
  cidr_block       = "10.0.0.0/24"
  instance_tenancy = "default"

  tags = {
    Name = "rvshare_vpc"
  }
}

resource "aws_subnet" "public" {
  vpc_id     = aws_vpc.rvshare_vpc.id
  cidr_block = "10.0.0.0/28"

  tags = {
    Name = "public"
  }
}


resource "aws_subnet" "private" {
  vpc_id     = aws_vpc.rvshare_vpc.id
  cidr_block = "10.0.0.16/28"

  tags = {
    Name = "private"
  }
}

resource "aws_internet_gateway" "public_subnet_gateway" {
  vpc_id = aws_vpc.rvshare_vpc.id

  tags = {
    Name = "public_subnet_gateway"
  }
}

resource "aws_route_table" "custom_route_table" {
  vpc_id = aws_vpc.rvshare_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.public_subnet_gateway.id
  }

  tags = {
    Name = "custom_route_table"
  }
}

resource "aws_route_table_association" "public_route_table_association" {
  subnet_id      = aws_subnet.public.id
  route_table_id = aws_route_table.custom_route_table.id
}

