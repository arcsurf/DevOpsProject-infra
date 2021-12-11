terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-3"
  # access_key = "my-access-key"
  # secret_key = "my-secret-key"
}

resource "aws_instance" "app_server" {
  ami           = "ami-06d79c60d7454e2af"
  instance_type = "t2.micro"

  tags = {
    Name = "devOpsAppServerInstance"
  }
}