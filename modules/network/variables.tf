variable "vpc_cidr" {
  description = "VPC Cidr Block"
  type = string
}

variable "public_subnets_cidr" {
  description = "Public subnet cidr range"
  type = list(string)  
}

variable "availability_zones" {
  description = "List of availabality zones"
  type = list(string)
  
}


