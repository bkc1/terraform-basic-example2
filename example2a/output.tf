output "vpc_id"             {value = "${aws_vpc.myapp.id}"} 

output "db_address"               {value = "${aws_rds_cluster.mydb.endpoint}"}
output "db_name"                  {value = "${aws_rds_cluster.mydb.database_name}"}
output "db_port"                  {value = "${aws_rds_cluster.mydb.port}"}

output "vpc_main_route_table_id"  {value = "${aws_vpc.myapp.main_route_table_id}"}
output "vpc_cidr_block"           {value = "${aws_vpc.myapp.cidr_block}"}

output "vpc_subnet1_id"           {value = "${aws_subnet.myapp1.id}"}
output "vpc_subnet2_id"           {value = "${aws_subnet.myapp2.id}"}

output "subnet1_cidr_block"       {value = "${aws_subnet.myapp1.cidr_block}"}
output "subnet2_cidr_block"       {value = "${aws_subnet.myapp2.cidr_block}"}

output "mydb_sec_group_id"        {value = "${aws_security_group.db.id}"}
output "web_sec_group_id"         {value = "${aws_security_group.web.id}"}
output "elb_sec_group_id"         {value = "${aws_security_group.elb.id}"}
