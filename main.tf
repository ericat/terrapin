provider "aws" {
  region = "${var.aws_region}"
  shared_credentials_file = "$HOME/.aws/credentials"
}

resource "aws_instance" "cat-stuff-web" {
  # Note: ami must belong to the correct region
  ami = "${var.aws_ami}"
  instance_type = "t2.micro"
  key_name = "${var.key_name}"
  vpc_security_group_ids = ["${aws_security_group.instance.id}"]

  connection {
    agent = false
    type = "ssh"
    user = "ec2-user"
    private_key = "${file("~/.ssh/cat-stuff.pem")}"
  }

  # Note: copying files over to the instance
  provisioner "file" {
    source = "app/"
    destination = "/home/ec2-user/"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y docker",
      "sudo service docker start",
      "sudo usermod -a -G docker ec2-user",
      "sudo docker build -t catstuff .",
      "sudo docker run -d -p 8080:8080 catstuff"
    ]
  }

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
    # Note CIDR to specfy blocks of addresses
    cidr_blocks = ["0.0.0.0/0"]
  }

  # add SSH
  ingress {
    from_port = "${var.ssh_port}"
    to_port = "${var.ssh_port}"
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port = 0
    to_port  = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

output "public_ip" {
  value = "${aws_instance.cat-stuff-web.public_ip}"
}
