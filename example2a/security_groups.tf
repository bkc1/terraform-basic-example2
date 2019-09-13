## Security group for DB
resource "aws_security_group" "db" {
  name        = "${var.app_prefix}-${var.env}-mydb"
  description = "${var.app_prefix} ${var.env} - Terraform managed"
  vpc_id      = "${aws_vpc.myapp.id}"
  tags {
    Name = "${var.app_prefix}-${var.env}"
  }
  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    cidr_blocks     = ["${aws_vpc.myapp.cidr_block}"]
  }

 # ICMP replys from the VPC
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["${aws_vpc.myapp.cidr_block}"]
  }

 # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


resource "aws_security_group" "web" {
  name        = "${var.app_prefix}-${var.env}-web"
  description = "${var.app_prefix} ${var.env} web - Terraform managed"
  vpc_id      = "${aws_vpc.myapp.id}"
  tags {
    Name = "${var.app_prefix}-${var.env}-web"
  }

  ingress {
    from_port       = 22
    to_port         = 22
    protocol        = "tcp"
    cidr_blocks     = ["${aws_vpc.myapp.cidr_block}"]
  }

  ingress {
    from_port       = 8080
    to_port         = 8080
    protocol        = "tcp"
    cidr_blocks     = ["${aws_vpc.myapp.cidr_block}"]
  }

 # ICMP replys from the VPC
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks     = ["${aws_vpc.myapp.cidr_block}"]
  }

# outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

#
resource "aws_security_group" "elb" {
  name        = "${var.app_prefix}-${var.env}-elb"
  description = "${var.app_prefix} ${var.env} ELB - Terraform managed"
  vpc_id      = "${aws_vpc.myapp.id}"
  tags {
    Name = "${var.app_prefix}-${var.env}-elb"
  }

# outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
