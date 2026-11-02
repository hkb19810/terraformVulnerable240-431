# Scan-only synthetic fixture.
# Target: aws_db_instance.test
# Curated expectation: FAILED
# Reason: backup_retention_period is explicitly 0.

resource "aws_db_instance" "test" {
  identifier = "synthetic-backup-db"
  engine = "postgres"
  instance_class = "db.t3.micro"
  backup_retention_period = 0
}
