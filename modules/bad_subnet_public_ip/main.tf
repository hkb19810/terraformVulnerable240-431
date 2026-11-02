# Scan-only synthetic fixture.
# Target: aws_subnet.test
# Curated expectation: FAILED
# Reason: map_public_ip_on_launch is explicitly true.

resource "aws_subnet" "test" {
  vpc_id = "vpc-0123456789abcdef0"
  cidr_block = "10.0.1.0/24"
  map_public_ip_on_launch = true
}
