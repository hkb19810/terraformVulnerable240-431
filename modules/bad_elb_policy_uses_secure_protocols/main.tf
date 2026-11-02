# Scan-only synthetic fixture.
# Target: aws_load_balancer_policy.test
# Curated expectation: FAILED
# Reason: The selected Classic ELB policy either permits old TLS or requires TLS 1.2.

resource "aws_load_balancer_policy" "test" {
  load_balancer_name = "synthetic-classic"
  policy_name = "synthetic-tls-policy"
  policy_type_name = "SSLNegotiationPolicyType"
  policy_attribute {
  name = "Reference-Security-Policy"
  value = "ELBSecurityPolicy-2016-08"
  }
}
