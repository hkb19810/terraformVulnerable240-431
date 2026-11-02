# Scan-only synthetic fixture.
# Target: aws_workspaces_workspace.test
# Curated expectation: FAILED
# Reason: user_volume_encryption_enabled is explicitly false.

resource "aws_workspaces_workspace" "test" {
  directory_id = "d-1234567890"
  bundle_id = "wsb-123456789"
  user_name = "synthetic-user"
  root_volume_encryption_enabled = true
  user_volume_encryption_enabled = false
}
