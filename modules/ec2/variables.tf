variable "name" {
  description = "Name of the EC2"
  type = string
}
variable "ami_id" {
  description = "AMI Id of the EC2"
  type = string
}
variable "instance_type" {
  description = "Instance of the EC2"
  type = string
}
variable "subnet_id" {
  description = "Subnet Id of the EC2"
  type = string
}
variable "security_group_id" {
  description = "Security Group of the EC2"
  type = list(string)
}
variable "key_name" {
  description = "SSH Key Name of the EC2"
  type = string
  default = null
}
variable "associate_public_ip" {
  description = "Associate Public IP of the EC2"
  type = bool
  default = false
}
variable "root_volume_size" {
  description = "Root Volume Size of the EC2"
  type = number
  default = 8
}
variable "root_volume_type" {
  description = "Root Volume Type of the EC2"
  type = string
  default = "gp3"
}
variable "tags" {
  description = "Tags of the EC2"
  type = map(string)
  default = {}
}