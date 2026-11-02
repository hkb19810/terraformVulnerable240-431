# Scan-only synthetic fixture.
# Target: aws_elasticsearch_domain.test
# Curated expectation: FAILED
# Reason: The endpoint setting explicitly selects the insecure or secure option.

resource "aws_elasticsearch_domain" "test" {
  domain_name = "synthetic-search"
  domain_endpoint_options { tls_security_policy = "Policy-Min-TLS-1-0-2019-07" }
}
