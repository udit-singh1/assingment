variable "ami" {
  default = "ami-08c40ec9ead489470"
}

variable "instance_type" {
  default = "t2.micro"
}

variable "key_name" {
  default = "ansible"
}

variable "tags_ec2" {
  default = {}
}

variable "ami_name" {
  default = "Nginx ami"
}