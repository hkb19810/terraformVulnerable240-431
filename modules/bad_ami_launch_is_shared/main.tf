# Scan-only synthetic fixture.
# Target: aws_ami_launch_permission.test
# Curated expectation: FAILED
# Reason: Public launch permission fails; a fixed account or organization is scoped.

resource "aws_ami_launch_permission" "test" {
  image_id = "ami-0123456789abcdef0"
  group = "all"
}
