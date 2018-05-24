variable "vpc_id" {}

data "aws_vpc" "selected" {
  id = "${var.vpc_id}"
}

output "vpc_data" {
  value = "${data.aws_vpc.selected.id}"
}
