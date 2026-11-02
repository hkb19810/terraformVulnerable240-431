# Scan-only synthetic fixture.
# Target: aws_imagebuilder_distribution_configuration.test
# Curated expectation: FAILED
# Reason: Source storage is unencrypted and destination regional encryption is explicitly disabled.

provider "aws" {
 region = "ap-south-1"
 allowed_account_ids = ["111111111111"]
}
provider "aws" {
 alias = "dest"
 region = "us-east-1"
 allowed_account_ids = ["222222222222"]
}
variable "unknown_bool" { type = bool }
variable "unknown_flags" { type = list(bool) }
variable "unknown_items" { type = list(string) }
variable "unknown_string" { type = string }
variable "known_true" { default = true }
resource "aws_ebs_encryption_by_default" "source" {
enabled = false
}
resource "aws_ebs_encryption_by_default" "target" {
provider = aws.dest
enabled = false
}
resource "aws_ebs_volume" "root" {
 availability_zone = "ap-south-1a"
 size = 8
 encrypted = false
}
resource "aws_ebs_snapshot" "root" { volume_id = aws_ebs_volume.root.id }
resource "aws_ami" "base" {
 name = "base"
 root_device_name = "/dev/xvda"
 ebs_block_device {
  device_name = "/dev/xvda"
  snapshot_id = aws_ebs_snapshot.root.id
 }
}
resource "aws_imagebuilder_image_recipe" "test" {
 name = "recipe"
 version = "1.0.0"
 parent_image = aws_ami.base.id

}
resource "aws_imagebuilder_distribution_configuration" "test" {
 name = "distribution"
 distribution {
region = "us-east-1"
ami_distribution_configuration {
name = "example-{{ imagebuilder:buildDate }}"
target_account_ids = ["222222222222"]

}
}

}
resource "aws_imagebuilder_image_pipeline" "test" {
 name = "pipeline"
 image_recipe_arn = aws_imagebuilder_image_recipe.test.arn
 distribution_configuration_arn = aws_imagebuilder_distribution_configuration.test.arn
 infrastructure_configuration_arn = "arn:aws:imagebuilder:ap-south-1:111111111111:infrastructure-configuration/test"
}
