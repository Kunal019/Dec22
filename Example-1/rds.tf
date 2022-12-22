# RDS subnet group

resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "${var.rds_subnet_name}"
  count = length(var.db_subnets_cidr)
  subnet_ids = ["${aws_subnet.db[count.index].id}"]


}

# RDS instance 

resource "aws_db_instance" "rds" {
  allocated_storage    = "${var.rds_storage}"
  engine               = "${var.rds_engine}"
  instance_class       = "${var.rds_instance_class}"
  name                 = "${var.rds_name}"
  username             = "${var.rds_username}"
  password             = "${var.rds_password}"
  db_subnet_group_name = "${var.rds_subnet_name}"
  depends_on = [aws_db_subnet_group.db_subnet_group]
}