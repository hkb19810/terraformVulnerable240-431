# Scan-only synthetic fixture.
# Target: aws_transfer_server.test
# Curated expectation: FAILED
# Reason: An Internet-facing VPC endpoint allows unrestricted ingress on the transfer port.

resource "aws_vpc" "net" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "net" {
  vpc_id = aws_vpc.net.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_eip" "net" {
  domain = "vpc"
}

resource "aws_internet_gateway" "net" {
  vpc_id = aws_vpc.net.id
}

resource "aws_route_table" "net" {
  vpc_id = aws_vpc.net.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.net.id
  }
}

resource "aws_route_table_association" "net" {
  subnet_id = aws_subnet.net.id
  route_table_id = aws_route_table.net.id
}

resource "aws_security_group" "net" {
  name = "test-transfer"
  vpc_id = aws_vpc.net.id
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_transfer_server" "test" {
  endpoint_type = "VPC"
  protocols = ["SFTP"]
  endpoint_details {
    vpc_id = aws_vpc.net.id
    subnet_ids = [aws_subnet.net.id]
    address_allocation_ids = [aws_eip.net.id]
    security_group_ids = [aws_security_group.net.id]
  }
}
