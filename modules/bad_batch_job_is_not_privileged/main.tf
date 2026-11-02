# Scan-only synthetic fixture.
# Target: aws_batch_job_definition.test
# Curated expectation: FAILED
# Reason: Privileged container mode fails; explicitly unprivileged containers pass.

resource "aws_batch_job_definition" "test" {
  name = "synthetic-job"
  type = "container"
  container_properties = jsonencode({
  image = "public.ecr.aws/docker/library/alpine:3"
  vcpus = 1
  memory = 128
  privileged = true
  })
}
