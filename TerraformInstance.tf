provider "aws" {
  region = "us-west-2"
  access_key = "AKIA4A67UEZX4ZUM6SW2"
  secret_key = "pKTJvuSq/eEkQqF9OgXQK2zahTgS3BWrfZmdLCYM"

}

resource "aws_security_group" "example" {
  name_prefix = "example"
  description = "Example security group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "ansible" {
  ami           = "ami-081f5e454de7be013"
  instance_type = "t2.micro"
  tags = {
    Name = "Ansible-Instance-01"
  }
 
  user_data     = <<-EOF
    #!/bin/bash
    apt update -y
    apt install -y ansible 
    ansible --version > /home/ubuntu/ansible_version.txt
  EOF
}

resource "aws_instance" "jenkins" {
  ami           = "ami-081f5e454de7be013"
  instance_type = "t2.micro"
  tags = {
    Name = "Jenkins-Instance-01"
  }
  user_data     = <<-EOF
    #!/bin/bash
    apt update -y
    apt install -y java-1.8.0-openjdk
    java -jar /usr/share/jenkins/jenkins.war --version > /home/ubuntu/jenkins_version.txt
  EOF
}

output "ansible_ip" {
  value = aws_instance.ansible.public_ip

}

output "jenkins_ip" {
  value = aws_instance.jenkins.public_ip
}
