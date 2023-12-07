resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "metabase_db_subnet_group"
  subnet_ids = [
    aws_subnet.db_subnet_1.id,
    aws_subnet.app_subnet_1.id,
  ]
}

resource "aws_db_instance" "metabase_db" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  identifier           = "metabase"
  username             = "db_metabase"
  password             = "Dasg5sg4sdfw"
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  multi_az = true
}
