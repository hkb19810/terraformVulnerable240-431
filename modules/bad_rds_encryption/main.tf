# Scan-only synthetic fixture.
# Target: aws_db_instance.test
# Curated expectation: FAILED
# Reason: storage_encrypted is explicitly false.

resource "aws_db_instance" "test" {
  identifier = "synthetic-db"
  engine = "postgres"
  instance_class = "db.t3.micro"
  allocated_storage = 20
  storage_encrypted = false
}
