# Scan-only synthetic fixture.
# Target: aws_security_group.test
# Curated expectation: FAILED
# Reason: Evaluate unrestricted TCP ingress, including CIDRs whose union covers the Internet.

resource "aws_security_group" "test" {
  name = "synthetic-ingress"
  vpc_id = "vpc-0123456789abcdef0"
  ingress {
  protocol = "tcp"
  from_port = 3389
  to_port = 3389
  cidr_blocks = ["0.0.0.0/0"]
  }
}
