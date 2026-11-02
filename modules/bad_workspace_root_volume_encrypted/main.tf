# Scan-only synthetic fixture.
# Target: aws_workspaces_workspace.test
# Curated expectation: FAILED
# Reason: root_volume_encryption_enabled is explicitly false.

resource "aws_workspaces_workspace" "test" {
  directory_id = "d-1234567890"
  bundle_id = "wsb-123456789"
  user_name = "synthetic-user"
  user_volume_encryption_enabled = true
  root_volume_encryption_enabled = false
}
