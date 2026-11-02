# Scan-only synthetic fixture.
# Target: aws_mq_broker.test
# Curated expectation: FAILED
# Reason: Audit logging is checked for ActiveMQ; RabbitMQ is outside this audit setting.

resource "aws_mq_broker" "test" {
  broker_name = "synthetic-broker"
  engine_type = "ActiveMQ"
  engine_version = "5.18"
  host_instance_type = "mq.t3.micro"
  logs { audit = false }
}
