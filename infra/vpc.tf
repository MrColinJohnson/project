module "vpc" {
  source             = "../modules/vpc"
  vpc_name           = "acme_vpc"
  public_cidr_block  = "10.0.0.0/28"
  private_cidr_block = "10.0.0.16/28"
}
