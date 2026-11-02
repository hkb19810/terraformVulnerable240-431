# Scan-only synthetic fixture.
# Target: aws_security_group.test
# Curated expectation: FAILED
# Reason: The curated rule's declared scope includes all protocols or every TCP/UDP port; a single port is outside this check.

resource "aws_security_group" "test" {
  name = "synthetic-protocols"
  ingress {
  protocol = "-1"
  from_port = 0
  to_port = 0
  cidr_blocks = ["0.0.0.0/0"]
  }
}
