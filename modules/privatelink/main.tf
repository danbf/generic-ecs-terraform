resource "aws_vpc_endpoint" "snowflake" {
  vpc_id              = var.vpc_id
  service_name        = var.snowflake_service_name
  vpc_endpoint_type   = "Interface"
  subnet_ids          = var.private_subnet_ids
  private_dns_enabled = true
}
