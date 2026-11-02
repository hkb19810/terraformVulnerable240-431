# Scan-only synthetic fixture.
# Target: aws_glacier_vault.test
# Curated expectation: FAILED
# Reason: Wildcard allow without a restricting condition is public.

resource "aws_glacier_vault" "test" {
  name = "synthetic"
  access_policy = <<POLICY
  {"Version": "2012-10-17", "Statement": [{"Effect": "Allow", "Principal": "*", "Action": "glacier:GetJobOutput", "Resource": "arn:aws:glacier:us-east-1:111111111111:vaults/synthetic"}]}
  POLICY
}
