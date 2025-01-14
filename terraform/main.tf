
provider "aws" {
  region = var.region
}

resource "aws_ecs_cluster" "cluster" {
  name = var.ecs_cluster_name
}


resource "aws_ecs_task_definition" "task" {
  family                   = "monitoring_definition"
  network_mode             = "awsvpc"
  cpu                      = "256"
  memory                   = "512"
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn

  container_definitions = jsonencode([
    {
      name          = var.app_name
      image         = "766261352911.dkr.ecr.us-west-2.amazonaws.com/cloud-monitoring-app"
      essential     = true
      portMappings  = [
        {
          containerPort = 5000
          hostPort      = 5000
        }
      ]
    }
  ])
}


resource "aws_ecs_service" "service" {
  name            = "monitor_service"
  cluster         = aws_ecs_cluster.cluster.id
  task_definition = aws_ecs_task_definition.task.arn
  desired_count   = 1
  launch_type     = "FARGATE"

  network_configuration {
    subnets         = var.subnet_ids
    assign_public_ip = true
    security_groups = ["sg-098d8e07dc8df4f85"]
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.app_target_group.arn
    container_name   = var.app_name
    container_port   = 5000
  }
}

resource "aws_lb" "app_lb" {
  name               = "monitor"
  internal           = false
  load_balancer_type = "application"
  security_groups    = ["sg-098d8e07dc8df4f85"]
  subnets            = var.subnet_ids
}

resource "aws_lb_target_group" "app_target_group" {
  name        = "m1"
  port        = 5000
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"
}

resource "aws_lb_listener" "app_listener" {
  load_balancer_arn = aws_lb.app_lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.app_target_group.arn
  }
}

