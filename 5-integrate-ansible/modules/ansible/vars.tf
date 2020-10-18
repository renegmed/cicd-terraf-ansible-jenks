variable "vpc_id" {
}

variable "env" {
}

variable "public_subnet_id" {
}
variable "ansible_user"{    
}

variable "ansible_password"{    
} 

variable "ansible_instance_count" {    
}

variable "region" {
  default = "us-east-1"
}

variable "ami" {
  default = "ami-0817d428a6fb68645"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "kuber-key-pair"
}

variable "instance_device_name" {
  default = "/dev/xvdh"
}

variable "security_group"{
}
