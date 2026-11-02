# Scan-only synthetic fixture.
# Target: data.aws_iam_policy_document.test
# Curated expectation: FAILED
# Reason: HTTPS is transport protection; it does not narrow a wildcard principal.

data "aws_iam_policy_document" "test" {
  statement {
  effect = "Allow"
  actions = ["sqs:ReceiveMessage"]
  resources = ["arn:aws:sqs:us-east-1:111111111111:synthetic"]
  principals {
  type = "*"
  identifiers = ["*"]
  }

  }
}
