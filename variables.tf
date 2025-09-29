variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "project_name" {
  description = "Name of the project"
  type        = string
}

variable "environment" {
  description = "Deployment environment (e.g., dev, prod)"
  type        = string
}

variable "frontend_memory" {
  description = "Memory (in MiB) for the frontend task"
  type        = number
  default     = 512
}

variable "frontend_cpu" {
  description = "CPU units for the frontend task"
  type        = number
  default     = 256
}

variable "frontend_image" {
  description = "Docker image for the frontend service"
  type        = string
  default   = ""
}

variable "frontend_port" {
  description = "Port for the frontend service"
  type        = number
  default     = 3000
}

variable "backend_cpu" {
  description = "CPU units for the backend task"
  type        = number
  default     = 256
}

variable "backend_memory" {
  description = "Memory (in MiB) for the backend task"
  type        = number
  default     = 512
}

variable "backend_image" {
  description = "Docker image for the backend service"
  type        = string
  default    = ""
}
variable "backend_port" {
  description = "Port for the backend service"
  type        = number
  default     = 8080
}

variable "desired_tasks" {
  description = "Number of desired tasks for the ECS service"
  type        = number
  default     = 1
}

variable "min_tasks" {
  description = "Minimum number of tasks for auto-scaling"
  type        = number
  default     = 1
}

variable "max_tasks" {
  description = "Maximum number of tasks for auto-scaling"
  type        = number
  default     = 3
}

variable "cpu_threshold" {
  description = "CPU utilization threshold for auto-scaling"
  type        = number
  default     = 70
}


