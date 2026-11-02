# Scan-only synthetic fixture.
# Target: aws_imagebuilder_image_recipe.test
# Curated expectation: FAILED
# Reason: A new disk is unencrypted even though other inherited storage is encrypted.

provider "aws" {
  region = "us-east-1"
  allowed_account_ids = ["111111111111"]
}
variable "unknown_bool" { type = bool }
variable "unknown_items" { type = list(string) }
variable "known_true" { default = true }
variable "known_false" { default = false }
resource "aws_ebs_encryption_by_default" "test" { enabled = false }
resource "aws_ebs_volume" "parent" {
  availability_zone = "us-east-1a"
  size = 8
  encrypted = true
}
resource "aws_ebs_snapshot" "parent" { volume_id = aws_ebs_volume.parent.id }
resource "aws_ami" "parent" {
  name = "test-parent"
  root_device_name = "/dev/xvda"
  virtualization_type = "hvm"
  ebs_block_device {
    device_name = "/dev/xvda"
    snapshot_id = aws_ebs_snapshot.parent.id
  }
}
resource "aws_imagebuilder_image_recipe" "test" {
  name = "test-recipe"
  version = "1.0.0"
  parent_image = aws_ami.parent.id
  component {
    component_arn = "arn:aws:imagebuilder:us-east-1:aws:component/update-linux/x.x.x"
  }
  block_device_mapping {
device_name = "/dev/xvdb"
ebs {
volume_size = 8
volume_type = "gp3"

}
}

}
