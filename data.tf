data "aws_ami" "selected" {
most_recent = true
filter {
name = "name"
values = [var.ami_name]
}
owners = [var.ami_owner]
}
