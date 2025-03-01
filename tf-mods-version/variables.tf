variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "tm"
}

variable "domain_name" {
  default     = "lab.moabukar.co.uk"
  description = "The domain name to use for the project"
  type        = string
}

variable "subdomain" {
  default     = "tm"
  description = "The subdomain to use for the project"
  type        = string
}

variable "ecr_repo_url" {
  description = "The URL of the ECR repository"
  default     = "010928194025.dkr.ecr.eu-west-2.amazonaws.com/tm"
  type        = string
}

variable "aws_region" {
  default     = "eu-west-2"
  description = "The AWS region to deploy to"
  type        = string
}

variable "container_port" {
  description = "The port the container exposes"
  type        = number
  default     = 3000
}

variable "desired_count" {
  description = "The desired number of tasks running in the ECS service"
  type        = number
  default     = 1
}
