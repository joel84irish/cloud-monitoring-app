#resource "aws_ecr_repository" "cloud" {
  name                 = "cloud-monitoring-app"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
