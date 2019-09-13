# Aurora cluster
resource "aws_rds_cluster" "mydb" {
  cluster_identifier      = "${var.app_prefix}-${var.env}-mydb"
  db_subnet_group_name    = "${aws_db_subnet_group.mydb.name}"
  database_name           = "mydb"
  master_username         = "foo"
  master_password         = "mypassword"
  backup_retention_period = 5
  preferred_backup_window = "07:00-09:00"
  vpc_security_group_ids  = ["${aws_security_group.db.id}"]
  skip_final_snapshot     = true
}

resource "aws_rds_cluster_instance" "mydb" {
  count                = 2
  identifier           = "${var.app_prefix}-${var.env}-mydb-${count.index}"
  cluster_identifier   = "${aws_rds_cluster.mydb.id}"
  db_subnet_group_name = "${aws_db_subnet_group.mydb.name}"
  instance_class       = "db.t2.small"
}

resource "aws_db_subnet_group" "mydb" {
  name       = "${var.app_prefix}-${var.env}"
  subnet_ids = ["${aws_subnet.myapp1.id}", "${aws_subnet.myapp2.id}"]
  tags {
    Name = "${var.app_prefix}-${var.env}"
  }
}

