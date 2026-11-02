# Scan-only synthetic fixture.
# Target: aws_neptune_cluster_instance.test
# Curated expectation: FAILED
# Reason: Curated logic combines the public flag with SG access to the database port.

resource "aws_security_group" "access" {
  name = "synthetic-neptune"
  ingress {
  protocol = "tcp"
  from_port = 8182
  to_port = 8182
  cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_neptune_cluster" "parent" {
  cluster_identifier = "synthetic-neptune"
  engine = "neptune"
  port = 8182
  vpc_security_group_ids = [aws_security_group.access.id]
}
resource "aws_neptune_cluster_instance" "test" {
  identifier = "synthetic-neptune-instance"
  cluster_identifier = aws_neptune_cluster.parent.id
  instance_class = "db.t3.medium"
  engine = "neptune"
  publicly_accessible = true
}
