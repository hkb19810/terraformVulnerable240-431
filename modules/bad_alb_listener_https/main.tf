# Scan-only synthetic fixture.
# Target: aws_lb_listener.test
# Curated expectation: FAILED
# Reason: HTTPS listeners and unconditional HTTPS redirects pass; HTTP forwarding fails.

resource "aws_lb" "parent" {
  name = "synthetic-alb"
  load_balancer_type = "application"
}
resource "aws_lb_listener" "test" {
  load_balancer_arn = aws_lb.parent.arn
  port = 443
  protocol = "HTTP"
  default_action {
  type = "forward"
  target_group_arn = "arn:aws:elasticloadbalancing:us-east-1:111111111111:targetgroup/test/1234567890123456"
  }
}
