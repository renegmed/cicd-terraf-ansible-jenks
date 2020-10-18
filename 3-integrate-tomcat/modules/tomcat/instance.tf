resource "aws_instance" "tomcat-instance" {
  ami           = var.ami  # data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  # the VPC subnet
  subnet_id = var.public_subnet_id

  # the security group
  vpc_security_group_ids = [var.security_group.id]

  # the public SSH key
  key_name = var.key_name

  # user data
  user_data = data.template_cloudinit_config.cloudinit-tomcat.rendered  
  # this will call scripts/jenkins-init.sh script on /dev/xvdh and set codes to /var/lib/jenkins

  # iam instance profile
  iam_instance_profile = var.tomcat_role_name
 
  tags = {
    Name = "tomcat-server-${var.env}"
  }
}
 