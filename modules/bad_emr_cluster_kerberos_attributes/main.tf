# Scan-only synthetic fixture.
# Target: aws_emr_cluster.test
# Curated expectation: FAILED
# Reason: Kerberos needs a nonblank realm; no Kerberos block is outside this recommendation.

resource "aws_emr_cluster" "test" {
  name = "synthetic-emr"
  release_label = "emr-7.0.0"
  service_role = "arn:aws:iam::111111111111:role/emr"
  kerberos_attributes {
  realm = "   "
  kdc_admin_password = "synthetic-not-a-real-password"
  }
}
