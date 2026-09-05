variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidrs" {
  description = "CIDR blocks for public subnets (2 AZs)"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "availability_zones" {
  description = "AZs to use"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
}

variable "instance_type" {
  description = "EC2 instance type for Auto Scaling Group"
  type        = string
  default     = "t3.micro"
}

variable "min_size" {
  description = "Minimum instances in ASG"
  type        = number
  default     = 1
}

variable "max_size" {
  description = "Maximum instances in ASG"
  type        = number
  default     = 3
}

variable "desired_capacity" {
  description = "Desired instances in ASG"
  type        = number
  default     = 2
}
