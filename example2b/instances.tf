
# Web instance in subnet/AZ 1
resource "aws_instance" "web1" {
  connection {
    user                  = "centos"
  }
  tags                    = {
    Name                  = "${var.app_prefix}-${var.env}-web1"
  }
  instance_type           = "${var.ec2_type}"
  ami                     = "${lookup(var.aws_amis, var.aws_region)}"
  key_name                = "${aws_key_pair.myapp.id}"
  vpc_security_group_ids  = ["${data.terraform_remote_state.exampleA.web_sec_group_id}"]
  subnet_id               = "${data.terraform_remote_state.exampleA.vpc_subnet1_id}"
  iam_instance_profile    = "${aws_iam_instance_profile.myapp.name}"
  root_block_device {
    delete_on_termination = true
    volume_type           = "standard"
  }
}

# Web instance in subnet/AZ 2
resource "aws_instance" "web2" {
  connection {
    user                  = "centos"
  }
  tags                    = {
    Name                  = "${var.app_prefix}-${var.env}-web2"
  }
  instance_type           = "${var.ec2_type}"
  ami                     = "${lookup(var.aws_amis, var.aws_region)}"
  key_name                = "${aws_key_pair.myapp.id}"
  vpc_security_group_ids  = ["${data.terraform_remote_state.exampleA.web_sec_group_id}"]
  subnet_id               = "${data.terraform_remote_state.exampleA.vpc_subnet2_id}"
  iam_instance_profile    = "${aws_iam_instance_profile.myapp.name}"
  root_block_device {
    delete_on_termination = true
    volume_type           = "standard"
  }
}

