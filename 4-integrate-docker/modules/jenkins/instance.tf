resource "aws_instance" "jenkins-instance" {
  ami           = var.ami  # data.aws_ami.ubuntu.id
  instance_type = var.instance_type

  # the VPC subnet
  subnet_id = var.public_subnet_id

  # the security group
  vpc_security_group_ids = [var.security_group.id]

  # the public SSH key
  key_name = var.key_name

  # user data
  user_data = data.template_cloudinit_config.cloudinit-jenkins.rendered  
  # this will call scripts/jenkins-init.sh script on /dev/xvdh and set codes to /var/lib/jenkins

  # iam instance profile
  iam_instance_profile = var.jenkins_role_name
 
  tags = {
    Name = "jenkins-server-${var.env}"
  }
}

# resource "aws_ebs_volume" "jenkins-data" {
#   availability_zone = var.availability_zone
#   size              = 20
#   type              = "gp2"
#   tags = {
#     Name = "jenkins-data"
#   }
# }

# resource "aws_volume_attachment" "jenkins-data-attachment" {
#   device_name  = var.instance_device_name
#   volume_id    = aws_ebs_volume.jenkins-data.id
#   instance_id  = aws_instance.jenkins-instance.id
#   skip_destroy = true
# }

# TODO:
# 
# module.jenkins.aws_volume_attachment.jenkins-data-attachment: Still creating... [10s elapsed]

# Error: Error attaching volume (vol-029dc7552956fde15) to instance (i-093b6efac53c4aee5), 
#     message: "The volume 'vol-029dc7552956fde15' is not in the same availability zone 
#     as instance 'i-093b6efac53c4aee5'", code: "InvalidVolume.ZoneMismatch"

