provider "aws" {
  region = "eu-west-2"
  shared_credentials_file = "$HOME/.aws/credentials"
}

resource "aws_instance" "cat-stuff-web" {
  ami = "ami-489f8e2c"
  instance_type = "t2.micro"
  key_name = "cat-stuff"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

  tags {
    Name = "terraform-example"
  }
}

resource "aws_security_group" "instance" {
  name = "terraform-example-instance"

  ingress {
    from_port = "${var.server_port}"
    to_port = "${var.server_port}"
    protocol = "tcp"
    # Note(ericat): CIDR to specfy blocks of addresses
    cidr_blocks = ["0.0.0.0/0"]
  }

  # add SSH
  ingress {
    from_port = "${var.ssh_port}"
    to_port = "${var.ssh_port}"
    protocol = "tcp"
    # Note(ericat): CIDR to specfy blocks of addresses
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port  = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

