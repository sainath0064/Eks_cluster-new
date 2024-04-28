module "vpc" {
    source = "github.com/vamshireddyk887/VPC_Using_Terraform/modules/vpc"
    
    cidr_block           = var.vpc_cidr
    enable_dns_support   = var.enable_dns_support
    enable_dns_hostnames = var.enable_dns_hostnames
    instance_tenancy     = var.instance_tenancy

    tags = {
        Name = var.vpc_name
    }
}

module "subnets" {
    source = "github.com/vamshireddyk887/VPC_Using_Terraform/modules/subnet"
    vpc_id            = module.vpc.vpc_id
    subnet_cidr       = var.subnet_cidr
    availability_zone = var.availability_zone
    subnet_name       = var.subnet_name
}

module "iam_role" {
  source    = "github.com/dsreehas/terraform-eks-iam-role"
  role_name = var.eks_role_name
}

resource "aws_eks_cluster" "my_cluster" {
  name     = var.cluster_name
  role_arn = module.iam_role.role_arn
  vpc_config {
    subnet_ids = module.subnets.public_subnet_ids
  }
  
}