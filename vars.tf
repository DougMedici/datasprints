variable "amis" {
  type = "map"

  default = {
      "us-east-1" = "ami-00ddb0e5626798373"
      "us-east-2" = "ami-0a0ad6b70e61be944"
  }
}

variable "cdirs_acesso_remoto" {
    type = "list"
    default = ["191.179.82.157/32","191.179.82.157/32" ]
}

variable "key_name" {
    default = "terraform-aws"
  
}