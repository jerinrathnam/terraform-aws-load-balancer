## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_load-balancer"></a> [load-balancer](#module\_load-balancer) | ../../ | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_health_check_paths"></a> [health\_check\_paths](#input\_health\_check\_paths) | List of health check paths | `list(string)` | <pre>[<br>  "/default-path",<br>  "/path-1",<br>  "path-2",<br>  "path-3"<br>]</pre> | no |
| <a name="input_host_names"></a> [host\_names](#input\_host\_names) | List of host name addresses | `list(string)` | <pre>[<br>  "1.example.com",<br>  "2.example.com",<br>  "3.example.com"<br>]</pre> | no |
| <a name="input_instance_id"></a> [instance\_id](#input\_instance\_id) | EC2 instance ID for target group attachment | `string` | `"i-08ec3be18eefcf07a"` | no |
| <a name="input_load_balancer_name"></a> [load\_balancer\_name](#input\_load\_balancer\_name) | Name for the Load Balancer | `string` | `"My-test-ALB"` | no |
| <a name="input_names"></a> [names](#input\_names) | List of names for target groups | `list(string)` | <pre>[<br>  "defaul-tg",<br>  "domain-1-tg",<br>  "domain-2-tg",<br>  "domain-3-tg"<br>]</pre> | no |
| <a name="input_ports"></a> [ports](#input\_ports) | List of the ports for target groups | `list(number)` | <pre>[<br>  80<br>]</pre> | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | List of security groups for load balancer | `list(string)` | `[]` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for your infrastructure | `map(string)` | `{}` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of the Ids of subnets | `list(string)` | <pre>[<br>  "subnet-1edmdm7j49",<br>  "subnet-2lc9854rev4",<br>  "subnet-3fc9j44b40c"<br>]</pre> | no |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | List of types of the targets for target groups. If one target is same for all then provide one target is enough | `list(string)` | <pre>[<br>  "instance"<br>]</pre> | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC id for target group | `string` | `"vpc-fni0gn34f04erc"` | no |

## Outputs

No outputs.
