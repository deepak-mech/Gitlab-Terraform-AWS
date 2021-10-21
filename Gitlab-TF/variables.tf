variable "aws_region" {
    default = "ap-south-1"
}

variable "vpc_cidr" {
    default = "10.0.0.0/16"
}

variable "subnet_cidr" {
    default = "10.0.1.0/24"
}

variable "azs" {
    default = "ap-south-1a"
}

variable "ami" {
    default = "ami-0a23ccb2cdd9286bb"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "instance_name" {
    default = "php_app"
}
