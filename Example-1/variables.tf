variable "default_region" {
  description = "AWS region"

}

variable "vpc_name" {
  description = "vpc name"
  default = "my_vpc"

}

variable "vpc_cidr" {
  description = "VPC CIDR"
}


variable "public_subnets_cidr" {
  description = "Public Subnet CIDR"

}

variable "web_subnets_cidr" {
  description = "Web Subnet CIDR"
}


variable "db_subnets_cidr" {
  description = "DB Subnet CIDR"
}

variable "rds_subnet_name" {
  description = "RDS Subnet group"
  default     = "rds_group"
}

variable "rds_storage" {
  default     = "50"
}

variable "rds_engine" {
  description = "RDS Engine"
  default     = "mysql"
}

variable "rds_instance_class" {
  description = "RDS class"
  default     = "db.t2.micro"
}

variable "rds_name" {
  description = "RDS Instance Name"
  default     = "mysql01"
}

variable "rds_username" {
  description = "RDS user"
  default     = "db_user"
}

variable "rds_password" {
  description = "RDS user password"
  default     = "password@123"
}

variable "websg_name" {
  description = "Web Server Security Group"
  default     = "web_sg"
}

variable "ami" {
  description = "AMI Id"
  default     = "ami-0873b46c45c11058d"
}

variable "instance_class" {
  description = "Instance type of webservers"
  default     = "t2.micro"
}

variable "webserver_name" {
  description = "Web server Names"
  default     = ["web-01", "web-02"]
}

variable "elb_name" {
  description = "ALB Name"
  default     = "web-elb"
}

variable "target_group" {
  description = "Application load balancer target group"
  default     = "applb-TargetGroup"
}

variable "target_group_port" {
  description = "Application load balancer target group port"
  default     = "80"
}

variable "target_group_protocol" {
  description = "Application load balancer target group protocol"
  default     = "HTTP"
}

variable "listener_port" {
  description = "ALB Listener Port"
  default     = "443"
}

variable "listener_protocol" {
  description = "Enter the protocol for the application load balancer target group"
  default     = "HTTPs"
}

# ACM ARN
variable "certificate_arn_user" {
  description = "ACM ARN"

}