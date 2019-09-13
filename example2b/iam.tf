#IAM

resource "aws_iam_instance_profile" "myapp" {
  name  = "${var.app_prefix}-${var.env}-${var.aws_region}-profile"
  role = "${aws_iam_role.myapp.name}"
}

resource "aws_iam_role" "myapp" {
  name               = "${var.app_prefix}-${var.env}-${var.aws_region}-role"
  assume_role_policy = <<EOF
{
  "Version": "2008-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": ["ecs.amazonaws.com", "ec2.amazonaws.com"]
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "myapp" {
  name   = "${var.app_prefix}-${var.env}-${var.aws_region}-policy"
  role   = "${aws_iam_role.myapp.id}"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ec2:Describe*",
        "ec2:AuthorizeSecurityGroupIngress",
        "elasticloadbalancing:DeregisterInstancesFromLoadBalancer",
        "elasticloadbalancing:DeregisterTargets",
        "elasticloadbalancing:Describe*",
        "elasticloadbalancing:RegisterInstancesWithLoadBalancer",
        "elasticloadbalancing:RegisterTargets",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "elasticfilesystem:*"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}
