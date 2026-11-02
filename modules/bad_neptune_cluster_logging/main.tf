# Scan-only synthetic fixture.
# Target: aws_neptune_cluster.test
# Curated expectation: FAILED
# Reason: Export configuration does not compensate for disabled audit generation.

resource "aws_neptune_cluster_parameter_group" "settings" {
 name = "logging-settings"
 family = "neptune1.3"
 parameter {
 name = "neptune_enable_audit_log"
 value = "0"
 apply_method = "pending-reboot"
}
}
resource "aws_neptune_cluster" "test" {
 engine = "neptune"
 cluster_identifier = "logging-test"
 enable_cloudwatch_logs_exports = ["audit"]
 neptune_cluster_parameter_group_name = aws_neptune_cluster_parameter_group.settings.name

}
