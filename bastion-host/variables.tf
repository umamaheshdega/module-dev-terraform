variable "project_name" {
  default = "mielleium"
}

variable "environment" {
  default = "dev"
}



variable "common_tags" {
  default = {
    project_name = "mielleium"
    environment  = "dev"
    terraform    = true
  }
}

variable "ami_id" {
  default = "ami-09c813fb71547fc4f"
}

