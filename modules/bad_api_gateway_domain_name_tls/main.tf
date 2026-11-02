# Scan-only synthetic fixture.
# Target: aws_api_gateway_domain_name.test
# Curated expectation: FAILED
# Reason: security_policy is explicitly "TLS_1_0".

resource "aws_api_gateway_domain_name" "test" {
  domain_name = "api.example.invalid"
  regional_certificate_arn = "arn:aws:acm:us-east-1:111111111111:certificate/11111111-1111-1111-1111-111111111111"
  endpoint_configuration { types = ["REGIONAL"] }
  security_policy = "TLS_1_0"
}
