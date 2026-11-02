# Scan-only synthetic fixture.
# Target: aws_ssm_document.test
# Curated expectation: FAILED
# Reason: A known log destination passes using service-default encryption; no destination fails.

resource "aws_ssm_document" "test" {
  name = "synthetic-session"
  document_type = "Session"
  content = <<DOC
  {"schemaVersion": "1.0", "sessionType": "Standard_Stream", "inputs": {}}
  DOC
}
