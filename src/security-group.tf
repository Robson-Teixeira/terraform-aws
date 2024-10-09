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