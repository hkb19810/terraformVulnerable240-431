# Scan-only synthetic fixture.
# Target: aws_ebs_encryption_by_default.test
# Curated expectation: FAILED
# Reason: enabled is explicitly false.

resource "aws_ebs_encryption_by_default" "test" {
  enabled = false
}
