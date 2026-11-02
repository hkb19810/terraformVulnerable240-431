# Scan-only synthetic fixture.
# Target: aws_ecs_cluster.test
# Curated expectation: FAILED
# Reason: A related service enables ECS Exec but the cluster selects NONE logging.

resource "aws_ecs_cluster" "test" {
name = "test-cluster"

configuration {
execute_command_configuration {
logging = "NONE"

}
}

}
resource "aws_ecs_service" "test" {
name = "test-service-test"
cluster = aws_ecs_cluster.test.id
desired_count = 1
task_definition = aws_ecs_task_definition.test.arn
enable_execute_command = true
}
resource "aws_ecs_task_definition" "test" {
family = "test-family-test"
container_definitions = <<JSON
[{"name": "app", "image": "nginx:latest", "memory": 128, "essential": true, "logConfiguration": {"logDriver": "awslogs", "options": {"awslogs-group": "/ecs/test", "awslogs-region": "us-east-1", "awslogs-stream-prefix": "ecs"}}}]
JSON
}
