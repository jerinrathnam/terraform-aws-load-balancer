
## Introduction

This Terraform module for AWS (Amazon Web Services) Load Balancer with Listeners and Target Groups offers a streamlined and powerful approach to creating and managing load balancers in your AWS infrastructure. Load balancers play a pivotal role in ensuring high availability, reliability, and scalability of web applications and services. With this Terraform module, you can declaratively define the setup of your load balancer, including listeners and target groups, using infrastructure as code.

Load balancers are critical components of modern cloud architectures, distributing incoming traffic across multiple instances, enhancing fault tolerance, and optimizing performance. This Terraform module simplifies the process of setting up a load balancer and the associated components:

**Load Balancer Configuration:** You can specify the type of load balancer (e.g., Application Load Balancer, Network Load Balancer) and its key attributes, such as the name, scheme, and IP address type.

**Listeners Configuration:** Define the listeners for your load balancer, including the protocol (HTTP, HTTPS, TCP, etc.), port, and SSL certificate (if applicable). This enables you to efficiently route incoming traffic to the right destination.

**Target Groups Configuration:** Set up target groups to group and manage the instances or services that the load balancer will distribute traffic to. You can configure health checks, port settings, and more for the target groups.

**Tags Configuration:** The module provides options for tagging your load balancer resources.

By using this Terraform module, you adopt an infrastructure-as-code approach to managing your AWS load balancer resources. This offers several benefits, including version control, consistency, and repeatability. It also facilitates collaboration among team members and aligns with best practices for infrastructure management and deployment.

This Terraform module for AWS Load Balancers with Listeners and Target Groups is a valuable tool for simplifying the provisioning and configuration of load balancing resources in your AWS environment. It helps you create a robust and scalable infrastructure that ensures the availability and performance of your applications.

## Usage

#### 1. Basic Example module for Application Load Balancer
```
module "load-balancer" {
  source  = "jerinrathnam/load-balancer/aws"
  
  certificate_arn       = var.certificate_arn
  host_names            = var.host_names
  health_check_paths    = var.health_check_paths
  name                  = var.target_group_name
  load_balancer_name    = var.load_balancer_name
  ports                 = var.ports
  security_groups       = [var.security_group_id]
  subnet_ids            = var.public_subnet_ids
  vpc_id                = var.vpc_id

  tags = {
    "Env" = "developement 
  }
}
```

#### 2. Basic Example module for Private Application Load Balancer
```
module "load-balancer" {
  source  = "jerinrathnam/load-balancer/aws"
  
  certificate_arn       = var.certificate_arn
  private_load_balancer = true
  host_names            = var.host_names
  health_check_paths    = var.health_check_paths
  name                  = var.target_group_name
  load_balancer_name    = var.load_balancer_name
  ports                 = var.ports
  security_groups       = [var.security_group_id]
  subnet_ids            = var.private_subnet_ids
  vpc_id                = var.vpc_id

  tags = {
    "Env" = "developement 
  }
}
```

#### 3. Example module for without Load Balancer and with listeners
```
module "load-balancer" {
  source  = "jerinrathnam/load-balancer/aws"
  
  certificate_arn       = var.certificate_arn
  do_not_create_alb     = true
  load_balancer_arn     = var.load_balancer_arn
  host_names            = var.host_names
  health_check_paths    = var.health_check_paths
  name                  = var.target_group_name
  ports                 = var.ports
  security_groups       = [var.security_group_id]
  subnet_ids            = var.public_subnet_ids
  vpc_id                = var.vpc_id

  tags = {
    "Env" = "developement 
  }
}
```


## Examples

- [Load Balancer, Listeners and Target Group with EC2 Instance](https://github.com/jerinrathnam/terraform-aws-load-balancer/tree/main/examples/ec2-instance-as-target)
- [Load Balancer, listeners with hostnames](https://github.com/jerinrathnam/terraform-aws-load-balancer/tree/main/examples/with-hostnames)
- [Load Balancer, listeners with hostnames and Hostpaths](https://github.com/jerinrathnam/terraform-aws-load-balancer/tree/main/examples/with-hostnames-and-paths)
- [Load Balancer, Https listeners with hostnames](https://github.com/jerinrathnam/terraform-aws-load-balancer/tree/main/examples/with-hostnames-https)
- [Load Balancer, listeners with hostpaths](https://github.com/jerinrathnam/terraform-aws-load-balancer/tree/main/examples/with-hostpaths)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.20.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 4.67.0 |

## Description

This is a Terraform module script to create Aws load Balancer with HTTP and HTTPS listeners and target groups.


## Resources

| Name | Type |
|------|------|
| [aws_lb.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb) | resource |
| [aws_lb_listener.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener) | resource |
| [aws_lb_listener_rule.http](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |
| [aws_lb_listener_rule.http_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |
| [aws_lb_listener_rule.https](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |
| [aws_lb_listener_rule.https_1](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_listener_rule) | resource |
| [aws_lb_target_group.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group) | resource |
| [aws_lb_target_group_attachment.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/lb_target_group_attachment) | resource |
| [aws_caller_identity.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_access_logs"></a> [access\_logs](#input\_access\_logs) | An Access Logs block. | <pre>object(<br>    {<br>      bucket  = string<br>      prefix  = string<br>      enabled = bool<br>    }<br>  )</pre> | `null` | no |
| <a name="input_certificate_arn"></a> [certificate\_arn](#input\_certificate\_arn) | ACM Certificate arn for the host name | `string` | `""` | no |
| <a name="input_create_listeners"></a> [create\_listeners](#input\_create\_listeners) | Whether the Load balancer listeners could be created | `bool` | `true` | no |
| <a name="input_do_not_create_alb"></a> [do\_not\_create\_alb](#input\_do\_not\_create\_alb) | Whether the Load balancer could not be created | `bool` | `false` | no |
| <a name="input_enable_cross_zone_load_balancing"></a> [enable\_cross\_zone\_load\_balancing](#input\_enable\_cross\_zone\_load\_balancing) | If true, cross-zone load balancing of the load balancer will be enabled | `bool` | `false` | no |
| <a name="input_enable_deletion_protection"></a> [enable\_deletion\_protection](#input\_enable\_deletion\_protection) | whether deletion protection for load balancer could be enabled | `bool` | `false` | no |
| <a name="input_enable_http2"></a> [enable\_http2](#input\_enable\_http2) | Indicates whether HTTP/2 is enabled in application load balancers | `bool` | `true` | no |
| <a name="input_enable_waf_fail_open"></a> [enable\_waf\_fail\_open](#input\_enable\_waf\_fail\_open) | Indicates whether to allow a WAF-enabled load balancer to route requests to targets if it is unable to forward the request to AWS WAF | `bool` | `false` | no |
| <a name="input_health_check_interval"></a> [health\_check\_interval](#input\_health\_check\_interval) | Approximate amount of time, in seconds, between health checks of an individual target | `number` | `30` | no |
| <a name="input_health_check_matcher"></a> [health\_check\_matcher](#input\_health\_check\_matcher) | Response codes to use when checking for a healthy responses from a target. | `string` | `"200-410"` | no |
| <a name="input_health_check_paths"></a> [health\_check\_paths](#input\_health\_check\_paths) | List of health check paths | `list(string)` | <pre>[<br>  "/"<br>]</pre> | no |
| <a name="input_health_check_protocol"></a> [health\_check\_protocol](#input\_health\_check\_protocol) | Protocol the load balancer uses when performing health checks on targets. | `string` | `"HTTP"` | no |
| <a name="input_health_check_timeout"></a> [health\_check\_timeout](#input\_health\_check\_timeout) | Amount of time, in seconds, during which no response from a target means a failed health check. | `number` | `5` | no |
| <a name="input_healthy_threshold"></a> [healthy\_threshold](#input\_healthy\_threshold) | Number of consecutive health check successes required before considering a target healthy | `number` | `5` | no |
| <a name="input_host_names"></a> [host\_names](#input\_host\_names) | List of host name addresses | `list(string)` | `[]` | no |
| <a name="input_host_names_and_paths"></a> [host\_names\_and\_paths](#input\_host\_names\_and\_paths) | List of key value pairs of Host names and host paths. For example [ {'host\_head\_1'='host\_path\_1'}, {'host\_head\_2'='host\_path\_2'} ] | `list(map(string))` | `[]` | no |
| <a name="input_host_paths"></a> [host\_paths](#input\_host\_paths) | List of host paths | `list(string)` | `[]` | no |
| <a name="input_http_listener_arn"></a> [http\_listener\_arn](#input\_http\_listener\_arn) | Http listener arn. Is needed only if 'create\_listeners' is set to 'false' | `string` | `null` | no |
| <a name="input_https_listener_arn"></a> [https\_listener\_arn](#input\_https\_listener\_arn) | Https listener arn. Is needed only if 'create\_listeners' is set to 'false' | `string` | `null` | no |
| <a name="input_instance_id"></a> [instance\_id](#input\_instance\_id) | EC2 instance ID for target group attachment | `string` | `null` | no |
| <a name="input_ip_address_type"></a> [ip\_address\_type](#input\_ip\_address\_type) | The type of IP addresses used by the subnets for your load balancer. | `string` | `null` | no |
| <a name="input_lb_idle_timeout"></a> [lb\_idle\_timeout](#input\_lb\_idle\_timeout) | The time in seconds that the connection is allowed to be idle. Only valid for Load Balancers of type application. | `number` | `60` | no |
| <a name="input_load_balancer_arn"></a> [load\_balancer\_arn](#input\_load\_balancer\_arn) | ARN of Loadbalancer. Is required if load balancer not created by this script | `string` | `null` | no |
| <a name="input_load_balancer_name"></a> [load\_balancer\_name](#input\_load\_balancer\_name) | Name for the Load Balancer | `string` | `""` | no |
| <a name="input_load_balancer_type"></a> [load\_balancer\_type](#input\_load\_balancer\_type) | Type of the Load Balancer | `string` | `"application"` | no |
| <a name="input_names"></a> [names](#input\_names) | List of names for target groups | `list(string)` | `[]` | no |
| <a name="input_ports"></a> [ports](#input\_ports) | List of the ports for target groups | `list(number)` | <pre>[<br>  80<br>]</pre> | no |
| <a name="input_preserve_host_header"></a> [preserve\_host\_header](#input\_preserve\_host\_header) | Indicates whether the Application Load Balancer should preserve the Host header in the HTTP request and send it to the target without any change. | `bool` | `false` | no |
| <a name="input_private_load_balancer"></a> [private\_load\_balancer](#input\_private\_load\_balancer) | whether the load balancer could be private | `bool` | `false` | no |
| <a name="input_protocol"></a> [protocol](#input\_protocol) | List of Types of the protocol for target groups. If one protocol is same for all then provide one protocol is enough | `list(string)` | <pre>[<br>  "HTTP"<br>]</pre> | no |
| <a name="input_security_groups"></a> [security\_groups](#input\_security\_groups) | List of security groups for load balancer | `list(string)` | `[]` | no |
| <a name="input_ssl_policy"></a> [ssl\_policy](#input\_ssl\_policy) | SSL security policy | `string` | `"ELBSecurityPolicy-TLS13-1-2-2021-06"` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of the Ids of subnets | `list(string)` | `[]` | no |
| <a name="input_subnet_mapping"></a> [subnet\_mapping](#input\_subnet\_mapping) | A subnet mapping block | <pre>list(<br>    object(<br>      {<br>        subnet_id            = string<br>        private_ipv4_address = string<br>        ipv6_address         = string<br>        allocation_id        = string<br>      }<br>    )<br>  )</pre> | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | Tags for your infrastructure | `map(string)` | `{}` | no |
| <a name="input_target_group_ports"></a> [target\_group\_ports](#input\_target\_group\_ports) | List of Ports for the Target groups. If one port is same for all then provide one port is enough | `list(number)` | <pre>[<br>  80<br>]</pre> | no |
| <a name="input_target_type"></a> [target\_type](#input\_target\_type) | List of types of the targets for target groups. If one target is same for all then provide one target is enough | `list(string)` | <pre>[<br>  "ip"<br>]</pre> | no |
| <a name="input_unhealthy_threshold"></a> [unhealthy\_threshold](#input\_unhealthy\_threshold) | Number of consecutive health check failures required before considering a target unhealthy. | `number` | `3` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC id for target group | `string` | `""` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_name"></a> [dns\_name](#output\_dns\_name) | DNS name of the Load balancer |
| <a name="output_target_group"></a> [target\_group](#output\_target\_group) | Details about the Target group |
| <a name="output_target_group_arn"></a> [target\_group\_arn](#output\_target\_group\_arn) | Target group arn |


## Authors
Module is maintained by [Jerin Rathnam](https://github.com/jerinrathnam).

**LinkedIn:** _[Jerin Rathnam](https://www.linkedin.com/in/jerin-rathnam)_.

## License
Apache 2 Licensed. See [LICENSE](https://github.com/jerinrathnam/terraform-aws-load-balancer/blob/main/LICENSE) for full details.