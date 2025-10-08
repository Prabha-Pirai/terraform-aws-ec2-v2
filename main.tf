# IAM role for EC2 (trust relationship for ec2.amazonaws.com)
resource "aws_iam_role" "ec2_role" {
name = var.iam_role_name
assume_role_policy = jsonencode({
Version = "2012-10-17"
Statement = [
{
Action = "sts:AssumeRole"
Effect = "Allow"
Principal = {
Service = "ec2.amazonaws.com"
}
}
]
3
})
}
# Attach any managed policies provided by the caller
resource "aws_iam_role_policy_attachment" "attach_managed" {
for_each = { for idx, arn in var.attach_policy_arns : idx => arn }
role = aws_iam_role.ec2_role.name
policy_arn = each.value
}
# Instance profile to reference from the EC2 instance
resource "aws_iam_instance_profile" "this" {
name = var.iam_role_name
role = aws_iam_role.ec2_role.name
}
# EC2 instance
resource "aws_instance" "this" {
ami = data.aws_ami.selected.id
instance_type = var.instance_type
subnet_id = var.subnet_id
vpc_security_group_ids = var.security_group_ids
key_name = var.key_name
associate_public_ip_address = var.associate_public_ip
iam_instance_profile = aws_iam_instance_profile.this.name
tags = {
Name = var.instance_name
}
}
# Optional Elastic IP (created and associated if create_eip = true)
resource "aws_eip" "this" {
count = var.create_eip ? 1 : 0
vpc = true
depends_on = [aws_instance.this]
tags = {
Name = "${var.instance_name}-eip"
}
}
resource "aws_eip_association" "this" {
count = var.create_eip ? 1 : 0
instance_id = aws_instance.this.id
allocation_id = aws_eip.this[count.index].id
}
