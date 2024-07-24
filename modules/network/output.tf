
output "vpc_id" {
  description = "The ID of the VPC"
  value       = "${aws_vpc.this.id}"
}
output "vpc" {
  description = "The ID of the VPC"
  value       = "${aws_vpc.this}"
}

output "vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = "${aws_vpc.this.cidr_block}"
}


output "public_subnet" {
  value = aws_subnet.public_subnet[0].id
}