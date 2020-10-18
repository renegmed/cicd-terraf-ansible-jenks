data "template_file" "tomcat-init" {
  template = file("modules/tomcat/scripts/tomcat-init.sh")
  vars = { 
    TOMCAT_VERSION   = var.tomcat_version 
  }
}

data "template_cloudinit_config" "cloudinit-tomcat" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/x-shellscript"
    content      = data.template_file.tomcat-init.rendered
  }
}
  