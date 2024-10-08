provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

resource "aws_instance" "dev" {
  count = 3 //Número de máquinas
  ami = "ami-0e86e20dae9224db8" //Amazon Machine Image
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev${count.index}" //Variável count concatenada com o índice
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"] #ID do acesso-ssh criado abaixo
}

resource "aws_security_group" "acesso-ssh" {
  name        = "acesso-ssh"
  description = "acesso-ssh"
  
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["ip1/porta", "ip2/porta"] #IP de saída (https://www.whatismyip.com/)
  }

  tags = {
    Name = "ssh"
  }
}

resource "aws_s3_bucket" "dev4" {
  bucket = "rmerceslabs-dev4"
  acl = "private"

  tags = {
    Name = "rmerceslabs-dev4"
  }
}

resource "aws_instance" "dev4" {  
  ami = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev4"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev5" {  
  ami = "ami-0e86e20dae9224db8"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev5"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}