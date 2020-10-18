data "template_file" "jenkins-init" {
  template = file("modules/jenkins/scripts/jenkins-init.sh")
  vars = {
    DEVICE            = var.instance_device_name
    JENKINS_VERSION   = var.jenkins_version 
  }
}

data "template_cloudinit_config" "cloudinit-jenkins" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.jenkins-init.rendered
  }
}
  