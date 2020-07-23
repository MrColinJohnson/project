variable "subnet" {
  description = "the subnet into which the instance will be placed"
}
variable "instance_name" {
  description = "the name of the ec2 box"
}
variable "instance_security_groups" {
  description = "the security groups which will be placed aroun the instance"
}
variable "userdata" {
  description = "path to the start up script"
}
variable "owner_id" {
  description = "the identification of who published this ami"
}
variable "machine_image" {
  description = "the path to the ami within the marketplace"
}
variable "vpc" {
  description = "the name of the vpc you are placing instances into"
}
