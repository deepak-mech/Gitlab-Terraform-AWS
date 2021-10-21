# Creating VPC
resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = "myvpc"
    }
}

# Creating Internet Gateway
resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "myigw"
  }
}

# Creating Subnet inside the VPC created above
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr
  availability_zone = var.azs
  map_public_ip_on_launch = true
  tags = {
    Name = "mysubnet"
  }
}

# Creating Route Table & Attach with the above created Internet Gateway
resource "aws_route_table" "example" {
  vpc_id = aws_vpc.main.id

  route {
      cidr_block = "0.0.0.0/0"
      gateway_id = aws_internet_gateway.gw.id
    }
  
  tags = {
    Name = "myRouteTable"
  }
}

# Associate Route Table with the Subnet created above
resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.main.id
  route_table_id = aws_route_table.example.id
}

