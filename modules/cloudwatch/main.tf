resource "aws_cloudwatch_log_group" "ecs" {
  name              = "/aws/ecs/${var.customer_name}-cluster"
  retention_in_days = 30
}
