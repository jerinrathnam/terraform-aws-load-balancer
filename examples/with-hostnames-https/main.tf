module "load-balancer" {
  source = "../../"

  host_names         = var.host_names
  load_balancer_name = var.load_balancer_name
  names              = var.names
  certificate_arn    = var.certificate_arn
  vpc_id             = var.vpc_id
  subnet_ids         = var.subnet_ids
  security_groups    = var.security_groups
  health_check_paths = var.health_check_paths
  ports              = var.ports
  tags               = var.tags
}