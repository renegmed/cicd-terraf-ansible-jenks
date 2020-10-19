variable "vpc_id" {
}

variable "env" {
}

variable "public_subnet_id" {
}

variable "region" {
}

variable "ami" { 
}

variable "instance_type" {
  default = "t2.micro"
}

variable "instance_count" {
  default ="1"
}

variable "key_name" {
}
 

variable "security_group"{    
}

variable "route_name" {
}

variable "k8s_role_name" {
}
 