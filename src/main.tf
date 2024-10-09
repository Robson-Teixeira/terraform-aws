provider "aws" {
  version = "~> 2.0"
  region  = "us-east-1"
}

provider "aws" {
  alias = "us-east-2"
  version = "~> 2.0"
  region  = "us-east-2"
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
  depends_on = ["aws_s3_bucket.dev4"] // Dependência entre recursos. Criação/exclusão de um implica respectivamente no outro.
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

resource "aws_instance" "dev6" {  
  provider = "aws.us-east-2"
  ami = "ami-0ea3c35c5c3284d82"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
    Name = "dev6"
  }
  vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
}