# Scan-only synthetic fixture.
# Target: aws_docdb_cluster_parameter_group.test
# Curated expectation: FAILED
# Reason: Any recognized nonempty audit mode satisfies the curated audit recommendation.

resource "aws_docdb_cluster_parameter_group" "test" {
  name = "synthetic-docdb"
  family = "docdb5.0"
  parameter {
  name = "audit_logs"
  value = "disabled"
  }
}
