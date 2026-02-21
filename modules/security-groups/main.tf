resource "aws_security_group" "this" {
  name = var.name
  description = var.description
  vpc_id = var.vpc_id

  tags = var.tags
}

resource "aws_security_group_rule" "ingress" {
    for_each = { for idx, rule in var.ingress_rules : idx => rule }
    type = "ingress"
    security_group_id = aws_security_group.this.id
    description = each.value.description
    from_port = each.value.from_port
    to_port =  each.value.to_port
    cidr_blocks = each.value.cidr_block
    protocol =  each.value.protocol
}

resource "aws_security_group_rule" "egress" {
    for_each = { for idx, rule in var.egress_rules : idx => rule }
    type = "egress"
    security_group_id = aws_security_group.this.id
    description = each.value.description
    from_port = each.value.from_port
    to_port =  each.value.to_port
    cidr_blocks = each.value.cidr_block
    protocol =  each.value.protocol
}