data "aws_subnet" "selected" {
  vpc_id            = "${data.aws_vpc.selected.id}"
  availability_zone = "us-east-1a"
}

output "subnet_id" {
  value = "${data.aws_subnet.selected.id}"
}
