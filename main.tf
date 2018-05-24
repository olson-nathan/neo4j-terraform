variable access_key {}
variable secret_key {}
variable instance_count {}
variable "vpc_id" {}

provider "aws" {
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
  region     = "${var.region}"
}

resource "aws_key_pair" "neo4j" {
  key_name   = "neo4j"
  public_key = "${file("~/.ssh/aws_terraform.pub")}"
}

module "networking" {
  source = "./networking"
  vpc_id = "${var.vpc_id}"
}

resource "aws_instance" "neo4j" {
  count                  = "${var.instance_count}"
  ami                    = "${var.ami}"
  instance_type          = "${var.instance_type}"
  vpc_security_group_ids = ["${module.networking.neo4j_security_group}"]
  subnet_id              = "${module.networking.subnet_id}"
  key_name               = "${aws_key_pair.neo4j.id}"
}
