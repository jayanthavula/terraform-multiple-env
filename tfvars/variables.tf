variable "project" {
  default = "expense"
}
variable "environment" {
  
}
variable "instances" {
  default = ["mysql","backend","frontend"]
}

variable "zone_id" {
  default = "Z06168571D0RSZB8QKC76"
}

variable "domain_name" {
  default =  "jaydevops.online"
}


variable "common_tags" {
  type = map
  default = {
    Project = "expense"
    terraform = "true"
  }
}