# Create ssh rsa key pair to connect to instances
resource "aws_key_pair" "key-pair" {
key_name      = "key-pair-mike-${terraform.workspace}"
public_key    = tls_private_key.rsa.public_key_openssh
}

resource "tls_private_key" "rsa" {
algorithm     = "RSA"
rsa_bits      = 4096
}


resource "aws_instance" "this" {
    ami = var.ami_id
    instance_type = var.inst_type
    count = var.ec2_count
    subnet_id = var.ec2_subnetID
    vpc_security_group_ids = ["${aws_security_group.default.id}"]
    associate_public_ip_address = true
    key_name = aws_key_pair.key-pair.key_name

  root_block_device {
    volume_type           = "gp2"
    volume_size           = "8"
    delete_on_termination = "true"
  }

}
