resource "aws_db_subnet_group" "main" {
  name       = "rds-subnet-group"
  subnet_ids = var.private_subnet_ids
}

resource "aws_db_instance" "postgres" {
  identifier             = "genomic-postgres-db"
  engine                 = "postgres"
  engine_version         = "15.4"
  instance_class         = "db.t4g.medium"
  allocated_storage      = 50
  multi_az               = true
  db_subnet_group_name   = aws_db_subnet_group.main.name
  vpc_security_group_ids = [var.db_security_group_id]
  skip_final_snapshot    = true
  storage_encrypted      = true
}
