
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.main-vpc.vpc_id
}
 
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.main-vpc.private_subnets
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.main-vpc.public_subnets
} 

output "security_group" {
  description = "security group"
  value       = aws_security_group.securitygroup
}

output "availability_zones" {
  description = "list of availability zones"
  value = module.main-vpc.azs
}

output "role_name" {
  description = "aim role name"
  value       = aws_iam_instance_profile.iam-role-profile.name 
}

# output "ns-servers" {
#   value = aws_route53_zone.app_route53.name_servers
# }