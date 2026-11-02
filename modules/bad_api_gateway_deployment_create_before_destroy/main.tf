# Scan-only synthetic fixture.
# Target: aws_api_gateway_deployment.test
# Curated expectation: FAILED
# Reason: Explicit replacement order controls create before destroy.

resource "aws_api_gateway_deployment" "test" {
  rest_api_id = "synthetic-api"
  lifecycle { create_before_destroy = false }
}
