variable "domain_name" {
  description = "The domain name for the Route53 hosted zone"
  type        = string
}

variable "subdomain" {
  description = "The subdomain to create a record for"
  type        = string
}

variable "alb_dns_name" {
  description = "The DNS name of the ALB"
  type        = string
}

variable "alb_zone_id" {
  description = "The hosted zone ID of the ALB"
  type        = string
}
