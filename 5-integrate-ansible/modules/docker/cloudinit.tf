  
data "template_file" "docker-init" {
  template = file("modules/docker/scripts/docker-init.sh")
  vars = { 
    DOCKER_USER      = var.docker_user 
    DOCKER_PASSWORD  = var.docker_password 
  }
}

data "template_cloudinit_config" "cloudinit-docker" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.docker-init.rendered
  }
}