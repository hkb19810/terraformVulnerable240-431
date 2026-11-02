# Scan-only synthetic fixture.
# Target: aws_ami.test
# Curated expectation: FAILED
# Reason: The AMI references a snapshot of known unencrypted storage.

provider "aws" {
  region = "us-east-1"
  allowed_account_ids = ["111111111111"]
}
variable "unknown_bool" { type = bool }
variable "unknown_snapshot" { type = string }
variable "unknown_items" { type = list(string) }
variable "known_true" { default = true }
variable "known_false" { default = false }
resource "aws_ebs_encryption_by_default" "test" { enabled = false }
resource "aws_ebs_volume" "root" {
  availability_zone = "us-east-1a"
  size = 8
  encrypted = false
}
resource "aws_ebs_snapshot" "root" { volume_id = aws_ebs_volume.root.id }
resource "aws_ami" "test" {
  name = "test-ami-encryption"
  virtualization_type = "hvm"
  root_device_name = "/dev/xvda"
  ebs_block_device {
    device_name = "/dev/xvda"
    snapshot_id = aws_ebs_snapshot.root.id
  }

}
