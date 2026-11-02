# Scan-only synthetic fixture.
# Target: aws_eks_node_group.test
# Curated expectation: FAILED
# Reason: An SSH key without source groups causes implicit unrestricted SSH access.

resource "aws_eks_node_group" "test" {
  cluster_name = "synthetic-eks"
  node_group_name = "synthetic-workers"
  node_role_arn = "arn:aws:iam::111111111111:role/node"
  subnet_ids = ["subnet-0123456789abcdef0"]
  remote_access {
  ec2_ssh_key = "synthetic-key"
  source_security_group_ids = []
  }
}
