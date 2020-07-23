variable "vpc_name" {
  description = "whatever you want to name your vpc"
}

variable "private_cidr_block" {
  description = "the cidr range to divide up the private subnet"
}

variable "public_cidr_block" {
  description = "the cidr range to divide up the public subnet"
}
