##https://registry.terraform.io/

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.61.0"
    }

  }
}

provider "aws" {
  region = "us-east-1"
}


resource "aws_iam_group" "demo" {
  name = "security"

}
resource "aws_iam_user" "user1" {
  name = "ode2023"

}


##**** user.tf 

resource "aws_iam_user" "user-demo" {
  name = "ode2026"
  tags = {
    Team                = "Devops"
    Env                 = "Dev"
    create_by_terraform = "yes"
    Owner               = "ode"
    email               = "dimitri@gmail.com"

  }
}

##**** group.tf

resource "aws_iam_group" "demo1" {
  name = "terraform-group"
}

##*** output.tf

output "user-arn" {
  value = aws_iam_user.user-demo.arn
}
output "group-arn" {
  value = aws_iam_group.demo.arn
}
output "group-id" {
  value = aws_iam_group.demo.id
}
output "username" {
  value = aws_iam_user.user-demo.name
}
output "user-tags" {
  value = aws_iam_user.user-demo.tags_all

}