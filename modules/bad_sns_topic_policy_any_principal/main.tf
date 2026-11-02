# Scan-only synthetic fixture.
# Target: aws_sns_topic.test
# Curated expectation: FAILED
# Reason: Wildcard allow without a restricting condition is public.

resource "aws_sns_topic" "test" {
  name = "synthetic"
  policy = <<POLICY
  {"Version": "2012-10-17", "Statement": [{"Effect": "Allow", "Principal": "*", "Action": "sns:Publish", "Resource": "arn:aws:sns:us-east-1:111111111111:synthetic"}]}
  POLICY
}
