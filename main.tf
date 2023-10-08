##https://registry.terraform.io/
  
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.61.0"
    }
    
  }
}

provider "aws" {
  region = "us-east-1"
  
}


##*** main.tf

terraform {

  required_providers {
    aws = {
        source = "hashicorp/aws"
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
    name = "serge2023"
  
}


##**** user.tf 

resource "aws_iam_user" "user-demo" {
  name = "serge2026"
  tags = {
    Team                = "Devops"
    Env                 = "Dev"
    create_by_terraform = "yes"
    Owner               = "serge"
    email               = "dimitri@gmail.com"

  }
}

##**** group.tf

resource "aws_iam_group" "demo" {
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