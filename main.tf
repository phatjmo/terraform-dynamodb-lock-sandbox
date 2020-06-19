provider "aws" {
  profile = "default"
  region  = "us-west-2"
}

terraform {
  backend "s3" {
    bucket = "jtzterraformbackend"
    key = "terraform"
    region = "us-west-2"
    dynamodb_table = "terraform-lock"
  }
}

resource "aws_instance" "example" {
  ami           = "ami-055d7c81399d5c3ce"
  instance_type = "t2.micro"

  tags = {
      Name = "GoAutoDial001"
      Environment = "Sandbox"
      "Product" = "GoAutoDial"
  }
}
