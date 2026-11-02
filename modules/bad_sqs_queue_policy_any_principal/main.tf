# Scan-only synthetic fixture.
# Target: aws_sqs_queue.test
# Curated expectation: FAILED
# Reason: Wildcard allow without a restricting condition is public.

resource "aws_sqs_queue" "test" {
  name = "synthetic"
  policy = <<POLICY
  {"Version": "2012-10-17", "Statement": [{"Effect": "Allow", "Principal": "*", "Action": "sqs:ReceiveMessage", "Resource": "arn:aws:sqs:us-east-1:111111111111:synthetic"}]}
  POLICY
}
