resource "aws_instance" "k8s-instance" {
  count         = var.instance_count  # 0 means not to create. Jenkins will create this instance
  ami           = var.ami             # data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  # the VPC subnet
  subnet_id = var.public_subnet_id

  # the security group
  vpc_security_group_ids = [var.security_group.id]

  # the public SSH key 
  key_name = var.key_name

  # user data
  user_data = data.template_cloudinit_config.cloudinit-k8s.rendered  
  
  # iam instance profile
  iam_instance_profile = var.k8s_role_name  # aws_iam_instance_profile.k8s-role.name

  tags = {
    Name = "k8s-manage-${var.env}"
  }
}

# resource "aws_ebs_volume" "k8s-data" {
#   availability_zone = "us-east-1a"
#   size              = 20
#   type              = "gp2"
#   tags = {
#     Name = "k8s-data"
#   }
# }

# resource "aws_volume_attachment" "k8s-data-attachment" {
#   device_name  = var.INSTANCE_DEVICE_NAME
#   volume_id    = aws_ebs_volume.jenkins-data.id
#   instance_id  = aws_instance.jenkins-instance.id
#   skip_destroy = true
# }
