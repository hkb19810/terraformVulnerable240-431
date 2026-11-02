# Scan-only synthetic fixture.
# Target: aws_cloudfront_distribution.test
# Curated expectation: FAILED
# Reason: Evaluate effective viewer TLS policy, including the default-certificate behavior.

resource "aws_cloudfront_distribution" "test" {
  enabled = true
  viewer_certificate {
  acm_certificate_arn = "arn:aws:acm:us-east-1:111111111111:certificate/11111111-1111-1111-1111-111111111111"
  ssl_support_method = "sni-only"
  minimum_protocol_version = "TLSv1"
  }
}
