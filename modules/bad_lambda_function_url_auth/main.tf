# Scan-only synthetic fixture.
# Target: aws_lambda_function_url.test
# Curated expectation: FAILED
# Reason: authorization_type is explicitly "NONE".

resource "aws_lambda_function_url" "test" {
  function_name = "synthetic-function"
  authorization_type = "NONE"
}
