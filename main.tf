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
  access_key = "AKIASIXD2FZZSEHIWRM7"
  secret_key = "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"
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = "${aws_instance.app_server.id}"
  allocation_id = "eipalloc-0f8cde3b8dd76eeaa"
}

resource "aws_instance" "app_server" {
  ami           = "ami-06d79c60d7454e2af"
  instance_type = "t2.micro"
  key_name   = "depOpsRemoteAccess"
  user_data = file("${path.module}/serverToolsInstall.sh")
  security_groups = [ "dockerApp" ]

  tags = {
    Name = "devOpsProject-app"
  }
}

resource "aws_security_group" "dockerApp" {
  tags = {
    type = "terraform-test-security-group"
  }
}


# resource "aws_eip" "elasticip" {
#   instance = aws_instance.app_server.id
#   as
# }

# output "EIP" {
#   value = aws_eip.elasticip.public_ip
# }