#VPC
vpc_cidr = "10.0.0.0/16"

#Instances
#Host Bastion Instance
hostBastion_key_pair_name       = "Terraform-keyPair"
hostBastion_ingress_cidr_blocks = ["136.36.44.79/32"]

#ForntEnd Instances
frontEnd_instance_type = "t2.micro"
frontEnd_key_pair_name = "Terraform-keyPair"

#Db
db_instance_type         = "db.t3.micro"
db_allocated_storage     = 20
db_max_allocated_storage = 100
db_name                  = "webappdb"
db_instance_identifier   = "webappdb"
db_username              = "dbadmin"
db_password              = "root12345"

#BackEnd Instances
backEnd_instance_type = "t2.micro"
backEnd_key_pair_name = "Terraform-keyPair"

#General Purpose
aws_region         = "us-east-1"
environment        = "dev"
bussiness_division = "HR"
domain             = "davidarevalo.xyz"