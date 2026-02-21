resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
 
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name="${var.environment}-vpc"
    Environment=var.environment
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name="${var.environment}-igw"
  }
}

resource "aws_subnet" "public_subnet1" {
  vpc_id=aws_vpc.this.id
  cidr_block = var.public_subnet_cidr_1
  availability_zone = var.availability_zone_1
  map_public_ip_on_launch = true

  tags = {
    Name="${var.environment}-public_sub_1"
  }
}
resource "aws_subnet" "public_subnet2" {
    vpc_id = aws_vpc.this.id
    cidr_block = var.public_subnet_cidr_2
    availability_zone = var.availability_zone_2
    map_public_ip_on_launch = true

    tags = {
      Name="{var.environment}-public_sub_2"
    }
}
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.this.id

    route ={
        cidr_block="0.0.0.0/0"
        aws_internet_gateway=aws_internet_gateway.this.id
    } 

    tags = {
      Name = "${var.environment}-public_route_table"
    }
}
resource "aws_route_table_association" "public1" {
    subnet_id = aws_subnet.public_subnet1.id
    route_table_id = aws_route_table.public.id  
}
resource "aws_route_table_association" "public2" {
    subnet_id = aws_subnet.public_subnet2.id
    route_table_id = aws_route_table.public.id  
}