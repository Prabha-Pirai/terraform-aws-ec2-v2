output "instance_id" {
description = "ID of the created EC2 instance"
value = aws_instance.this.id
}
output "instance_public_ip" {
description = "Public IP assigned to the instance (may be changed by EIP)"
value = aws_instance.this.public_ip
}
output "eip_public_ip" {
description = "Elastic IP public address (null if create_eip is false)"
value = length(aws_eip.this) > 0 ? aws_eip.this[0].public_ip : null
}
output "iam_role_name" {
description = "Name of the created IAM role"
value = aws_iam_role.ec2_role.name
}
output "instance_profile_name" {
description = "Name of the created IAM instance profile"
value = aws_iam_instance_profile.this.name
}
