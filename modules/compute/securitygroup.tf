/*==== VPC's Default Security Group ======*/
resource "aws_security_group" "default" {
  name        = "main-default-sg"
  description = "Default security group to allow inbound/outbound from the VPC"
  vpc_id      = var.vpc_id
  
  ingress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = true
  }
  
  egress {
    from_port = "0"
    to_port   = "0"
    protocol  = "-1"
    self      = "true"
  }
}