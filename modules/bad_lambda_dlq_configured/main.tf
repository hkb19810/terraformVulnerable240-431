# Scan-only synthetic fixture.
# Target: aws_lambda_function.test
# Curated expectation: FAILED
# Reason: An applicable asynchronous invocation needs a DLQ or an OnFailure destination.

resource "aws_lambda_function" "test" {
  function_name = "synthetic-function"
  role = "arn:aws:iam::111111111111:role/lambda"
  runtime = "python3.12"
  handler = "index.handler"
  filename = "synthetic-function.zip"
}
resource "aws_lambda_function_event_invoke_config" "async" {
  function_name = aws_lambda_function.test.function_name
  maximum_retry_attempts = 2
}
