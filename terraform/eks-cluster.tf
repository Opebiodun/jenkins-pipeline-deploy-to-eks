module "eks" {
    source  = "terraform-aws-modules/eks/aws"
    version = "~> 19.0"
    cluster_name = "myapp-eks-cluster"
    cluster_version = "1.29"

    cluster_endpoint_public_access  = true

    

    vpc_id = module.myapp-vpc.vpc_id
    subnet_ids = module.myapp-vpc.private_subnets

    tags = {
        environment = "development"
        application = "myapp
        }

    eks_managed_node_groups = {
        dev = {
             desired_capacity = 2
             max_capacity     = 3
             min_capacity     = 1
            
            instance_types = ["t2.small"]
        }
    }
}

