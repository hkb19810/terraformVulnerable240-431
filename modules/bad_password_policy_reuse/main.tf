# Scan-only synthetic fixture.
# Target: aws_iam_account_password_policy.test
# Curated expectation: FAILED
# Reason: password_reuse_prevention is explicitly 11.

resource "aws_iam_account_password_policy" "test" {
  password_reuse_prevention = 11
}
