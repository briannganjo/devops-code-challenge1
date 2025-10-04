#Global variables
ws_region = "us-east-1"

#VPC CIDR block
vpc_cidr = "10.0.0.0/16"

#Project name
project_name = "techchallenge1"

#Environment tag
environment = "dev"

#Frontend Task
frontend_cpu    = 256
frontend_memory = 512
frontend_image  = "" # leave empty to use your ECR repo latest
frontend_port   = 3000

#Backend Task
backend_cpu    = 256
backend_memory = 512
backend_image  = "" # leave empty to use your ECR repo latest
backend_port   = 8080

# Service scaling
desired_tasks = 1

#auto-scaling
min_tasks     = 1
max_tasks     = 3
cpu_threshold = 70
