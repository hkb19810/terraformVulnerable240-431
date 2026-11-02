# Scan-only synthetic fixture.
# Target: aws_appsync_graphql_api.test
# Curated expectation: FAILED
# Reason: Logging configuration is required, but field-level logging is not separately required.

resource "aws_appsync_graphql_api" "test" {
  name = "synthetic-api"
  authentication_type = "AWS_IAM"
}
