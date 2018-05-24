data "aws_security_group" "selected" {
  name = "neo4j"
}

output "neo4j_security_group" {
  value = "${data.aws_security_group.selected.id}"
}
