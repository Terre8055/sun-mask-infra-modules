variable "ami_id" {
  description = "AMI Id"
  type = string
}

variable "inst_type" {
    description = "Instance type"
    type = string
}

# variable "az" {
#   description = "Availaility zone"
#   type = list(string)
# }

variable "ec2_count" {
  description = "Number of provisioned servers"
  type = number
}

variable "ec2_subnetID" {
  description = "Subnet Association for instances"
  type =   string
}


variable "vpc_id" {
  description = "Create dependency in resource provisioning with vpc"
  type = string
}

# variable "ec2_secgrpID" {
#   description = "Security Group Association for instances"
#   type =   string
# }