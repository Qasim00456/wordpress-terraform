
resource "aws_vpc" "wordpress_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "wordpress-vpc"
  }
}

resource "aws_subnet" "wordpress_subnet" {
  vpc_id                  = aws_vpc.wordpress_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "eu-north-1a"

  tags = {
    Name = "wordpress-subnet"
  }
}

resource "aws_internet_gateway" "wordpress_igw" {
  vpc_id = aws_vpc.wordpress_vpc.id

  tags = {
    Name = "wordpress-igw"
  }
}

resource "aws_route_table" "wordpress_rt" {
  vpc_id = aws_vpc.wordpress_vpc.id

  tags = {
    Name = "wordpress-rt"
  }
}

resource "aws_route" "wordpress_internet" {
  route_table_id         = aws_route_table.wordpress_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.wordpress_igw.id
}

resource "aws_route_table_association" "wordpress_assoc" {
  subnet_id      = aws_subnet.wordpress_subnet.id
  route_table_id = aws_route_table.wordpress_rt.id
}

