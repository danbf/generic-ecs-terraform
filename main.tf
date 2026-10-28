module "vpc" {
  source        = "./modules/vpc"
  customer_name = var.customer_name
}

module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
}

module "cloudwatch" {
  source        = "./modules/cloudwatch"
  customer_name = var.customer_name
}

module "rds" {
  source             = "./modules/rds-postgres"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  db_security_group_id = module.security.db_security_group_id
}

module "alb_waf" {
  source             = "./modules/alb-waf"
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnet_ids
  customer_name      = var.customer_name
}

module "ecs" {
  source                = "./modules/ecs-fargate"
  vpc_id                = module.vpc.vpc_id
  private_subnet_ids    = module.vpc.private_subnet_ids
  ecs_security_group_id = module.security.ecs_security_group_id
  target_group_arn      = module.alb_waf.target_group_arn
  log_group_name        = module.cloudwatch.ecs_log_group_name
}

module "privatelink" {
  source             = "./modules/privatelink"
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  snowflake_service_name = "com.amazonaws.vpce.us-east-1.vpce-svc-snowflake"
}
