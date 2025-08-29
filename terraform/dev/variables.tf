# ----------- General Environment Variables -----------
variable "env" {
  description = "Environment name (dev/stg/prod)"
  type        = string
  default     = "dev"
}


# ----------- EC2 Variables -----------
variable "ami" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0cfde0ea8edd312d4" # Example: Amazon Linux 2
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_count" {
  description = "Number of EC2 instances to launch"
  type        = number
  default     = 2
}

variable "volume_size" {
  description = "Root EBS volume size in GB"
  type        = number
  default     = 10
}

variable "hash_key" {
  type = string
  default = "LockID"
}



