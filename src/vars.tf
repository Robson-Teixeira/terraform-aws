variable "amis" {
  type        = "map"

  default     = {
    "us-east-1" = "ami-0e86e20dae9224db8"
    "us-east-2" = "ami-0ea3c35c5c3284d82"
  }
  description = "description"
}
