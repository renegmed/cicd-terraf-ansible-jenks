  
data "template_file" "ansible-init" {
  template = file("modules/ansible/scripts/ansible-init.sh")
  vars = {
    DEVICE            = var.instance_device_name
    ANSIBLE_USER      = var.ansible_user
    ANSIBLE_PASSWORD  = var.ansible_password
  }
}

data "template_cloudinit_config" "cloudinit-ansible" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.ansible-init.rendered
  }
}