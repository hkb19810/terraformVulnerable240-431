# Scan-only synthetic fixture.
# Target: aws_iam_account_password_policy.test
# Curated expectation: FAILED
# Reason: minimum_password_length is explicitly 7.

resource "aws_iam_account_password_policy" "test" {
  minimum_password_length = 7
}
