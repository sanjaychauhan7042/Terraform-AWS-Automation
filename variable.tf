variable "vpc_cidr_block" {
    description = "value of the VPC CIDR block"
    type        = string
    default = ""

}

variable "availability_zone1" {
    description = "value of the availability zone 1"
    type        = string
    default = ""
  
}

variable "availability_zone2" {
    description = "value of the availability zone 2"
    type        = string
    default = ""
  
}

variable "subnet1_cidr_block" {
    description = "value of the subnet 1 CIDR block"
    type        = string
    default = ""
  
}

variable "subnet2_cidr_block" {
    description = "value of the subnet 2 CIDR block"
    type        = string
    default = ""
  
}

variable "ami" {
    description = "value of the AMI ID"
    type = string
    default = ""
}

variable "region" {
    description = "value of the region"
    type = string
    default = ""
  
}

variable "instance_type" {
    description = "value of the instance type"
    type = string
    default = ""
  
}