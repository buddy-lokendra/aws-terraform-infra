output "alb_dns_name" {
  description = "Public URL of the Load Balancer"
  value       = "http://${aws_lb.app.dns_name}"
}

output "vpc_id" {
  value = aws_vpc.main.id
}

output "asg_name" {
  value = aws_autoscaling_group.app.name
}
