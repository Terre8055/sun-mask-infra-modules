resource "aws_db_instance" "default" {
  allocated_storage    = 10
  engine               = "mysql"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  skip_final_snapshot  = true
  db_subnet_group_name = aws_db_subnet_group.default.name
  vpc_security_group_ids = [aws_security_group.default.id]
}

resource "aws_security_group" "default" {
  name        = "default-security-group"
  description = "Default security group for RDS"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # Replace with your allowed CIDR blocks
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_subnet_group" "default" {
  name       = "default-subnet-group"
  subnet_ids = ["subnet-xxxxxx", "subnet-yyyyyy"]  # Replace with your subnet IDs
  description = "Default subnet group for RDS"
}

resource "aws_rds_cluster" "aurora_cluster" {
  cluster_identifier      = "aurora-cluster-demo"
  engine                  = "aurora-mysql"
  engine_version          = "5.7.mysql_aurora.2.08.1"
  master_username         = "root"
  master_password         = "yourpassword"  # Change this to a secure password
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  skip_final_snapshot     = true
  db_subnet_group_name    = aws_db_subnet_group.default.name
  vpc_security_group_ids  = [aws_security_group.default.id]

  lifecycle {
    ignore_changes = [master_password]  # Prevent Terraform from detecting password changes
  }
}

resource "aws_rds_cluster_instance" "aurora_instances" {
  count              = 1  # Number of instances in the cluster
  identifier         = "aurora-cluster-demo-instance-${count.index + 1}"
  cluster_identifier = aws_rds_cluster.aurora_cluster.id
  instance_class     = "db.r5.large"
  engine             = aws_rds_cluster.aurora_cluster.engine
  engine_version     = aws_rds_cluster.aurora_cluster.engine_version
  publicly_accessible = true  # Set to false if you do not want public access
}