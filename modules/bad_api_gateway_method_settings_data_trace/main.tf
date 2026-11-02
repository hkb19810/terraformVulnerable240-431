# Scan-only synthetic fixture.
# Target: aws_api_gateway_method_settings.test
# Curated expectation: FAILED
# Reason: Explicit data tracing is evaluated independently of ordinary INFO execution logging.

resource "aws_api_gateway_rest_api" "parent" {
  name = "synthetic-api"
}
resource "aws_api_gateway_deployment" "parent" {
  rest_api_id = aws_api_gateway_rest_api.parent.id
}
resource "aws_api_gateway_stage" "parent" {
  rest_api_id = aws_api_gateway_rest_api.parent.id
  deployment_id = aws_api_gateway_deployment.parent.id
  stage_name = "prod"
}
resource "aws_api_gateway_method_settings" "test" {
  rest_api_id = aws_api_gateway_rest_api.parent.id
  stage_name = aws_api_gateway_stage.parent.stage_name
  method_path = "*/*"
  settings {
  logging_level = "INFO"
  data_trace_enabled = true
  }
}
