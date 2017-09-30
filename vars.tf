variable "aws_instance_user" {
  description = "The AWS user"
  default = "ericat"
}
variable "aws_region" {
  description = "The AWS region to use"
  default = "eu-west-2"
}

variable "aws_ami" {
  description = "The AWS ami to use"
  default = "ami-489f8e2c"
  # Note: Ireland: ami-ebd02392
}

variable "key_name" {
  description = "The key name"
  default = "cat-stuff"
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default = 8080
}

variable "ssh_port" {
  description = "The port we can use to SSH into the instance"
  default = 22
}

