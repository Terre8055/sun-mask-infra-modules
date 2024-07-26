resource "aws_db_instance" "default" {
  allocated_storage = 10
  engine = "aurora-mysql"
  
  instance_class = "db.t3.micro"
  username = "foo"
  password = "foobarbaz"
  skip_final_snapshot = true
}
