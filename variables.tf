variable "region" {
  type    = "string"
  default = "us-east-1"
}

variable "ami" {
  type    = "string"
  default = "amzn-ami-2017.09.i-amazon-ecs-optimized"
}

variable "instance_type" {
  type    = "string"
  default = "m4.large"
}
