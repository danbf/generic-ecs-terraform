resource "aws_security_group" "ecs" {
  name   = "ecs-task-sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group" "db" {
  name   = "rds-postgres-sg"
  vpc_id = var.vpc_id
}
