terraform {
  backend "remote" {
    hostname = "app.terraform.io"
    organization = "robson-teixeira-org"

    workspaces {
      name = "aws-dev"
    }
  }
}