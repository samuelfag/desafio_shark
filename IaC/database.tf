provider "aws" {
  region = "us-east-1"
}

resource "aws_rds_global_cluster" "metabase" {
  name = "metabase"
  engine = "mysql"
  engine_version = "8.0.27"
  db_subnet_group_name = aws_rds_db_subnet_group.metabase.id
  multi_az = true
  tags = {
    Name = "Metabase Database"
  }
}

resource "aws_rds_instance" "metabase-primary" {
  db_instance_class = "db.t2.micro"
  db_cluster_identifier = aws_rds_global_cluster.metabase.id
  db_instance_name = "metabase-primary"
  availability_zone = "us-east-1a"
  tags = {
    Name = "Metabase Primary Instance"
  }
}

resource "aws_rds_instance" "metabase-replica" {
  db_instance_class = "db.t2.micro"
  db_cluster_identifier = aws_rds_global_cluster.metabase.id
  db_instance_name = "metabase-replica"
  availability_zone = "us-east-1b"
  tags = {
    Name = "Metabase Replica Instance"
  }
}

resource "aws_rds_database" "metabase" {
  name = "metabase"
  global_cluster_identifier = aws_rds_global_cluster.metabase.id
  engine = "mysql"
  engine_version = "8.0.27"
  allocated_storage = 5
}