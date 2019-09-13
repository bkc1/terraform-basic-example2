resource "aws_elb" "myapp" {
  name            = "${var.app_prefix}-${var.env}-elb"
  subnets         = ["${data.terraform_remote_state.exampleA.vpc_subnet1_id}", "${data.terraform_remote_state.exampleA.vpc_subnet2_id}"]
  security_groups = ["${data.terraform_remote_state.exampleA.elb_sec_group_id}"]
  instances       = ["${aws_instance.web1.id}", "${aws_instance.web2.id}"]
  cross_zone_load_balancing = true
  connection_draining = true
  listener {
    instance_port      = 80
    instance_protocol  = "http"
    lb_port            = 80
    lb_protocol        = "http"
  }
  tags {
    Environment = "${var.app_prefix}-${var.env}"
  }
}

