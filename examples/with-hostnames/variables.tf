variable "names" {
  type        = list(string)
  description = "List of names for target groups"
  default     = ["defaul-tg", "domain-1-tg", "domain-2-tg", "domain-3-tg"]
}

variable "load_balancer_name" {
  type        = string
  description = "Name for the Load Balancer"
  default     = "My-test-ALB"
}

variable "host_names" {
  type        = list(string)
  description = "List of host name addresses"
  default     = ["1.example.com", "2.example.com", "3.example.com"]
}

variable "health_check_paths" {
  type        = list(string)
  description = "List of health check paths"
  default     = ["/default-path", "/path-1", "/path-2", "/path-3"]
}

variable "ports" {
  type        = list(number)
  description = "List of the ports for target groups"
  default     = [80]
}

variable "security_groups" {
  type        = list(string)
  description = "List of security groups for load balancer"
  default     = []
}

variable "vpc_id" {
  type        = string
  description = "VPC id for target group"
  default     = "vpc-fni0gn34f04erc"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of the Ids of subnets"
  default     = ["subnet-1edmdm7j49", "subnet-2lc9854rev4", "subnet-3fc9j44b40c"]
}

variable "tags" {
  type        = map(string)
  description = "Tags for your infrastructure"
  default     = {}
}