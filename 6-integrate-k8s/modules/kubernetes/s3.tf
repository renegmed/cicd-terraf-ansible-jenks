resource "aws_s3_bucket" "kops_state_bucket" {
  bucket = "k8s.${var.route_name}"  # "k8s.${var.route_name}-${random_string.random.result}"
  acl    = "private"

  tags = {
    Name = "kops-state-${var.env}"
  }
}

# resource "random_string" "random" {
#   length  = 8
#   special = false
#   upper   = false
# }

