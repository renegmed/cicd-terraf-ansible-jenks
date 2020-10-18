resource "aws_iam_role" "iam-role" {
  name               = "iam-role-${var.env}"
  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

}

resource "aws_iam_instance_profile" "iam-role-profile" {
  name = "iam-role-profile"
  role = aws_iam_role.iam-role.name
}

resource "aws_iam_role_policy" "admin-policy" {
  name = "admin-policy"
  role = aws_iam_role.iam-role.id

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": [
      {
        "Action": [
          "*"
        ],
        "Effect": "Allow",
        "Resource": "*"
      }
    ]
  }
  EOF
}

# Need to limit to 
#   AmazonEC2FullAccess 
#   AmazonS3FullAccess 
#   AmazonRoute53FullAccess
#   IAMFullAccess
