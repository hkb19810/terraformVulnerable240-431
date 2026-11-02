# Scan-only synthetic fixture.
# Target: aws_network_acl.test
# Curated expectation: FAILED
# Reason: An earlier matching NACL deny takes precedence over a later allow.

resource "aws_network_acl" "test" {
  vpc_id = "vpc-0123456789abcdef0"
  ingress {
  protocol = "tcp"
  rule_no = 100
  action = "allow"
  cidr_block = "0.0.0.0/0"
  from_port = 21
  to_port = 21
  }
}
