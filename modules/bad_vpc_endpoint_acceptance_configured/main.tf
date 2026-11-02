# Scan-only synthetic fixture.
# Target: aws_vpc_endpoint_service.test
# Curated expectation: FAILED
# Reason: Automatic acceptance is acceptable only with explicitly scoped principals.

resource "aws_vpc_endpoint_service" "test" {
  acceptance_required = false
  network_load_balancer_arns = ["arn:aws:elasticloadbalancing:us-east-1:111111111111:loadbalancer/net/synthetic/1234567890123456"]
  allowed_principals = ["*"]
}
