variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}


#Default tags for resources
variable "tags"{
    description     = "Default tags"
    type            = map(string)
    default         = {
        owner       = "michael.appiah.dankwah"
        workspace   = "mike-org-test"
    }
}

variable "ami_id" {
  description = "AMI Id"
  type = string
  default = "ami-0d3f444bc76de0a79"
}

variable "inst_type" {
    description = "Instance type"
    type = string
    default = "t3a.xlarge"
}

# variable "az" {
#   description = "Availaility zone"
#   type = string
# }

variable "vpc_cidr" {
  description = "VPC Cidr Block"
  type = string
  default = "10.0.0.0/20"
}

# variable "public_subnets_cidr" {
#   description = "Public subnet cidr range"
#   type = list(string)
# }

variable "availability_zones" {
  description = "List of availabality zones"
  type = list(string)
  default = [ "us-east-1a" ]
  
}

# variable "environment" {
#   description = "Unique environment name for security groups"
#   type = string
# }


variable "ec2_count" {
  description = "Number of provisioned servers"
  type = number
  default = 10
}

# variable "ec2_subnetID" {
#   description = "Subnet Association for instances"
#   type =   string
# }

# variable "ec2_secgrpID" {
#   description = "Security Group Association for instances"
#   type =   string    
# }


# variable "vpc_id" {
#   description = "Create dependency in resource provisioning with vpc"
#   type = string
# }

# variable "get_vpc" {
#   description = "Trail Vpc"
#   type = string
# }