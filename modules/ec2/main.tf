resource "aws_instance" "this" {
  ami= var.ami_id
  instance_type = var.instance_type
  subnet_id = var.subnet_id
  vpc_security_group_ids = var.security_group_id
  key_name = var.key_name
  associate_public_ip_address = var.associate_public_ip

  root_block_device {
    volume_size = var.root_volume_size
    volume_type = var.root_volume_type
  }

  tags = merge({
    Name=var.name
  },
    var.tags
  )
}