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
}