# Scan-only synthetic fixture.
# Target: aws_cloudsearch_domain.test
# Curated expectation: FAILED
# Reason: The endpoint setting explicitly selects the insecure or secure option.

resource "aws_cloudsearch_domain" "test" {
  domain_name = "synthetic-search"
  endpoint_options { enforce_https = false }
}
