terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.22.0"
    }
  }
}

provider "aws" {
  version = "3.22.0"
  region  = "us-east-1"
}
provider "aws" {
  alias = "us-east-2"
  version = "3.22.0"
  region  = "us-east-2"
}
resource "aws_instance" "dev" {
  count = 3  
  ami = "ami-00ddb0e5626798373"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
      Name = "dev${count.index}"
  }
vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev4" {
  ami = "ami-00ddb0e5626798373"
  instance_type = "t2.micro"
  key_name = "terraform-aws"
  tags = {
      Name = "dev4"
  }
vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
#depends_on = [aws_s3_bucket.dev4]
}

resource "aws_instance" "dev5" {
ami = var.amis["us-east-1"]
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
      Name = "dev5"
  }
vpc_security_group_ids = ["${aws_security_group.acesso-ssh.id}"]
}

resource "aws_instance" "dev6" {
  provider = "aws.us-east-2"
  ami = var.amis["us-east-2"]
  instance_type = "t2.micro"
  key_name = var.key_name
  tags = {
      Name = "dev6"
  }
vpc_security_group_ids = ["${aws_security_group.acesso-ssh-us-east-2.id}"]
}
  