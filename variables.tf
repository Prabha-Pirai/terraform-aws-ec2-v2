variable "ami_name" {
description = "AMI name pattern (example: \"amzn2-ami-hvm-*-x86_64-gp2\")
used by data.aws_ami"
type = string
}
variable "ami_owner" {
description = "AMI owner (for public AMIs you can use \"amazon\" or an
owner id)"
type = string
}
variable "instance_type" {
description = "EC2 instance type (e.g. t3.micro)"
type = string
}
variable "subnet_id" {
description = "Subnet ID where the instance will be launched"
type = string
}
variable "security_group_ids" {
description = "List of security group IDs to attach to the instance"
type = list(string)
}
variable "key_name" {
description = "Existing EC2 Key Pair name (for SSH access)"
type = string
}
variable "associate_public_ip" {
description = "Whether to associate a public IPv4 address on launch"
type = bool
}
variable "instance_name" {
description = "Value for the Name tag on the EC2 instance"
type = string
}
variable "iam_role_name" {
description = "Name to create the IAM role and instance profile with"
type = string
}
variable "attach_policy_arns" {
2
description = "List of managed policy ARNs to attach to the IAM role (e.g.
AmazonSSMManagedInstanceCore)"
type = list(string)
}
variable "create_eip" {
description = "Create and attach an Elastic IP to the instance? (true/
false)"
type = bool
}
