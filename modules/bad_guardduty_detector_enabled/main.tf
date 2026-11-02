# Scan-only synthetic fixture.
# Target: aws_guardduty_detector.test
# Curated expectation: FAILED
# Reason: enable is explicitly false.

resource "aws_guardduty_detector" "test" {
  enable = false
}
