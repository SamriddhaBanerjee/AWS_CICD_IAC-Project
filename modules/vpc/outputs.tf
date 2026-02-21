output "vpc_id" {
  value=aws_vpc.this.id
}
output "public_sub_1" {
  value = aws_subnet.public_subnet1.id
}
output "public_sub_2" {
  value = aws_subnet.public_subnet2.id
}