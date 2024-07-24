module "compute" {
    source = "./modules/compute"

    # az = var.az
    # ec2_secgrpID = "${module.network.public_subnet}
    ec2_count = var.ec2_count
    ec2_subnetID = "${module.network.public_subnet}"
    ami_id = var.ami_id
    inst_type = var.inst_type
    vpc_id = "${module.network.vpc_id}"
    
}

module "network" {
  source = "./modules/network"


  vpc_cidr = var.vpc_cidr
  availability_zones = var.availability_zones
  public_subnets_cidr = ["10.0.204.0/22"]

}