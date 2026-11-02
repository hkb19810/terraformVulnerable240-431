# Scan-only synthetic fixture.
# Target: aws_redshift_parameter_group.test
# Curated expectation: FAILED
# Reason: Explicit SSL false fails; the curated redshift-2.0 default passes.

resource "aws_redshift_parameter_group" "test" {
  name = "synthetic-redshift"
  family = "redshift-2.0"
  parameter {
  name = "require_ssl"
  value = "false"
  }
}
