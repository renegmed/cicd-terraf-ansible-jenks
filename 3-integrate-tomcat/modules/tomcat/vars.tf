variable "tomcat_version" {
  default = "8.5.35"
}
variable "vpc_id" {
}

variable "env" {
}

variable "public_subnet_id" {
}

variable "region" {
  default = "us-east-1"
}

variable "availability_zone" {
}

variable "ami" {
  default = "ami-0817d428a6fb68645"
}
variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {  
}

variable "instance_device_name" {
  default = "/dev/xvdh"
}
 

variable "security_group"{
}

variable "tomcat_role_name" {
}