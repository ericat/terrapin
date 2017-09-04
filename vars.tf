variable "aws_instance_user" {
  description = "The AWS user"
  default = "ericat"
}

variable "server_port" {
  description = "The port the server will use for HTTP requests"
  default = 8080
}

variable "ssh_port" {
  description = "The port we can use to SSH into the instance"
  default = 22
}

