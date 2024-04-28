variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type=string
  default = "10.0.0.0/16"
}

variable "enable_dns_support" {
  description = "A boolean flag to enable/disable DNS support in the VPC"
  type = bool
  default = true
}

variable "enable_dns_hostnames" {
  description = "A boolean flag to enable/disable DNS hostnames in the VPC"
  type = bool
  default = true

}

variable "instance_tenancy" {
  description = "A tenancy option for instances launched into the VPC"
  type = string
  default = "default"
}

variable "vpc_name" {
  description = "The name of the VPC"
  type = string
  default = "my_vpc"

}

variable "subnet_cidr" {
  description = "CIDR blocks for the subnets."
  type        = list(string)
  default     = ["10.0.0.0/18", "10.0.64.0/18", "10.0.128.0/18", "10.0.192.0/18"]
}

variable "availability_zone" {
  description = "Availability zones for the subnets."
  type        = list(string)
  default     = ["us-east-1a", "us-east-1a", "us-east-1b", "us-east-1b"]
}

variable "subnet_name" {
  description = "Names of the subnets."
  type        = list(string)
  default     = ["public_subnet_1", "public_subnet_2", "private_subnet_1", "private_subnet_2"]
}

variable "eks_role_name"{ 
  description = "Name of the IAM role for EKS"
  type = string
  default = "eks_role"
}

variable "cluster_name" {
  description = "Name of the EKS cluster"
  type = string
  default = "my_eks_cluster"
}
