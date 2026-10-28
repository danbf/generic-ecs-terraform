variable "vpc_id" { type = string }
variable "private_subnet_ids" { type = list(string) }
variable "ecs_security_group_id" { type = string }
variable "target_group_arn" { type = string }
variable "log_group_name" { type = string }
