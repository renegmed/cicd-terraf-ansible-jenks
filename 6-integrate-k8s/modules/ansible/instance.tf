resource "aws_instance" "ansible-instance" { # this instance will not be create when 'terraform apply' is called 
  count         = var.ansible_instance_count # 0 means not to create. Jenkins will create this instance
  ami           = var.ami   # for now it is empty. It will be determined later
  instance_type = var.instance_type

  # the VPC subnet
  subnet_id = var.public_subnet_id # var.public_subnets[1]

  # the security group
  vpc_security_group_ids = [var.security_group.id]

  # user data
  user_data = data.template_cloudinit_config.cloudinit-ansible.rendered  
  
  # the public SSH key
  key_name = var.key_name

   tags = {
    Name = "ansible-server-${var.env}"
  }
}
