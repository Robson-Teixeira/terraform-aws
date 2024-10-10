variable "amis" {
  type        = "map"

  default     = {
    "us-east-1" = "ami-0e86e20dae9224db8"
    "us-east-2" = "ami-0ea3c35c5c3284d82"
  }
  description = "description"
}

variable "cidr_blocks" {
    type = "list"

    default = ["ip1/porta", "ip2/porta"]
}

variable "instance_type" {
    //type = "string" é o padrão

    default = "t2.micro"
}

variable "key_name" {
    default = "terraform-aws"
}