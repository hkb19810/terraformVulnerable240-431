# Scan-only synthetic fixture.
# Target: aws_mwaa_environment.test
# Curated expectation: FAILED
# Reason: Evaluate the selected MWAA log type independently.

resource "aws_mwaa_environment" "test" {
  name = "synthetic-airflow"
  execution_role_arn = "arn:aws:iam::111111111111:role/mwaa"
  source_bucket_arn = "arn:aws:s3:::synthetic-airflow"
  logging_configuration {
  scheduler_logs {
  enabled = false
  log_level = "INFO"
  }
  }
}
