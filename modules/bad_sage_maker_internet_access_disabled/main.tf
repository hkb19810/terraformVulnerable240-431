# Scan-only synthetic fixture.
# Target: aws_sagemaker_notebook_instance.test
# Curated expectation: FAILED
# Reason: direct_internet_access is explicitly "Enabled".

resource "aws_sagemaker_notebook_instance" "test" {
  name = "synthetic-notebook"
  instance_type = "ml.t3.medium"
  role_arn = "arn:aws:iam::111111111111:role/notebook"
  direct_internet_access = "Enabled"
}
