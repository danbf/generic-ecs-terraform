output "alb_dns_name" {
  value = module.alb_waf.alb_dns_name
}

output "rds_endpoint" {
  value     = module.rds.endpoint
  sensitive = true
}

output "ecs_cluster_name" {
  value = module.ecs.cluster_name
}
