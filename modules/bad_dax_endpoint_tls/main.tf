# Scan-only synthetic fixture.
# Target: aws_dax_cluster.test
# Curated expectation: FAILED
# Reason: cluster_endpoint_encryption_type is explicitly "NONE".

resource "aws_dax_cluster" "test" {
  cluster_name = "synthetic-dax"
  node_type = "dax.t3.small"
  replication_factor = 1
  iam_role_arn = "arn:aws:iam::111111111111:role/dax"
  cluster_endpoint_encryption_type = "NONE"
}
