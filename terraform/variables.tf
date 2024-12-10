variable "ami_id" {
  description = "This is the ami ID for the instance"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "key_pair_name" {
  description = "The name of the EC2 key pair"
  type        = string
}

variable "vpc-name" {
  description = "Name of the VPC"
  default     = "MainVPC"
}


variable "subnet-name" {
  description = "Name of the Subnet"
  default     = "MainSubnet"
}

variable "igw-name" {
  description = "Name of the Internet Gateway"
  default     = "MainIGW"
}

variable "rt-name" {
  description = "Name of the Route Table"
  default     = "MainRouteTable"
}

variable "sg-name" {
  description = "Name of the Security Group"
  default     = "MainSG"
}

variable "instace_name" {
  description = "Name of the Instance"
  type        = string
}


variable "frontend_domain" {
  description = "Domain name for the frontend"
  type        = string
}

variable "db_domain" {
  description = "Domain name for the database admin (Adminer)"
  type        = string
}

variable "traefik_domain" {
  description = "Domain name for traefik Proxy Manager"
  type        = string
}

variable "cert_email" {
  description = "Email for the let's encrypt certificate"
  type        = string
}

variable "domain_name" {
  description = "the hosted zone domain name"
  type        = string
}

variable "private_key_path" {
  description = "private key path for ansible ssh access"
  type        = string
}


# Region Configuration
variable "aws_region" {
  description = "Primary AWS region for resources"
  type        = string
}

# Backend Configuration Variables
variable "backend_bucket_prefix" {
  description = "Prefix for the S3 backend bucket name"
  type        = string
  default     = "devops-challenge-tfstate"
}

variable "backend_dynamodb_table_name" {
  description = "Name of the DynamoDB table for Terraform state locking"
  type        = string
  default     = "devops-challenge-tfstate-locks"
}

variable "backend_state_key" {
  description = "Path to the state file in the S3 bucket"
  type        = string
  default     = "terraform/devops-challenge/terraform.tfstate"
}

# Optional: Additional backend configuration
variable "backend_encrypt" {
  description = "Enable encryption for backend state"
  type        = bool
  default     = true
}

variable "common_tags" {
  description = "Common tags to be applied to all resources"
  type = object({
    Project     = string
    Environment = string
    ManagedBy   = string
  })
  default = {
    Project     = "DevOps Challenge"
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}

# Optional: Additional specific tag variables
variable "backend_tags" {
  description = "Additional tags specific to backend resources"
  type        = map(string)
  default     = {}
}

variable "grafana_domain" {
  description = "The domain for Grafana"
  type        = string
}

variable "prometheus_domain" {
  description = "The domain for Prometheus"
  type        = string
}


variable "app_dir" {
  description = "This the directory where the cloned git repo will be stored in the ansible task"
  type        = string
}

variable "repo" {
  description = "Your source code repo"
  type        = string
}