# Scan-only synthetic fixture.
# Target: aws_elb.test
# Curated expectation: FAILED
# Reason: cross_zone_load_balancing is explicitly false.

resource "aws_elb" "test" {
  name = "synthetic-classic"
  cross_zone_load_balancing = false
}
