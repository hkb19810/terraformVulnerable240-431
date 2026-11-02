# Scan-only synthetic fixture.
# Target: aws_lb.test
# Curated expectation: FAILED
# Reason: Either protective desync mode or dropping invalid headers satisfies the curated rule.

resource "aws_lb" "test" {
  name = "synthetic-alb"
  load_balancer_type = "application"
  desync_mitigation_mode = "monitor"
  drop_invalid_header_fields = false
}
