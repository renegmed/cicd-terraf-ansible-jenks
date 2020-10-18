variable "env" {
    default = "dev"
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

variable "route_name" {
    default ="goldmedal.tech"
}

variable "key_name" {
  default = "kuber-key-pair"
}