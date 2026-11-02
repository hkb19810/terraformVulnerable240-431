# Scan-only synthetic fixture.
# Target: aws_acm_certificate.test
# Curated expectation: FAILED
# Reason: Explicit replacement order controls create before destroy.

resource "aws_acm_certificate" "test" {
  domain_name = "certificate.example.invalid"
  validation_method = "DNS"
  lifecycle { create_before_destroy = false }
}
