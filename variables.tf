#VPC
variable "vpc_cidr" {
  type = string
}

#Instance
#Host Bastion Instance
variable "hostBastion_ingress_cidr_blocks" {
  description = "Ip list for allowed devices"
  type        = list(string)
}

variable "hostBastion_key_pair_name" {
  type = string
}


#ForntEnd Instances
variable "frontEnd_instance_type" {
  type = string
}

variable "frontEnd_key_pair_name" {
  type = string
}

#DB
variable "db_instance_type" {
  type = string
}

variable "db_allocated_storage" {
  type = number
}

variable "db_max_allocated_storage" {
  type = number
}

variable "db_name" {
  type      = string
  sensitive = true
}

variable "db_instance_identifier" {
  type      = string
  sensitive = true
}

variable "db_username" {
  type      = string
  sensitive = true
}

variable "db_password" {
  type      = string
  sensitive = true
}

#BackEnd Instances
variable "backEnd_instance_type" {
  type = string
}

variable "backEnd_key_pair_name" {
  type = string
}

#General Purpose
variable "aws_region" {
  description = "Region in wich Aws Resouces to be created"
  type        = string
  default     = "us-east-1"
}

variable "environment" {
  description = "Enviroment variable used as a prefix"
  type        = string
  default     = "dev"
}

variable "bussiness_division" {
  description = "Business Division in the large organizarion"
  type        = string
  default     = "HR"
}

variable "domain" {
  description = "App Domain"
  type        = string
}

variable "app_name" {
  description = "App Name"
  type        = string
  default     = "techpulse-store"
}