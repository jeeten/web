resource "aws_iam_role" "nodes" {
    name = "${local.env}-${local.eks_name}-eks-nodes"

    description = "EKS Node IAM Role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "ec2.amazonaws.com"
                }
            }
        ]   
        })
}

resource "aws_iam_role_policy_attachment" "amazone_eks_worker_node_policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    role = aws_iam_role.nodes.name
}

resource "aws_iam_role_policy_attachment" "amazone_eks_cni_policy" { 
    policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    role = aws_iam_role.nodes.name
}


resource "aws_iam_role_policy_attachment" "amazone_ec2_container_registry_policy" {
    policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    role = aws_iam_role.nodes.name
}

resource "aws_eks_node_group" "general" {
    cluster_name = aws_eks_cluster.eks.name
    version = local.eks_version
    node_group_name = "general"
    node_role_arn = aws_iam_role.nodes.arn

    subnet_ids = [
        aws_subnet.private_zone1.id,
        aws_subnet.private_zone2.id
    ]

    instance_types = ["t3.large"]
    capacity_type = "ON_DEMAND"

    scaling_config {
        desired_size = 1
        max_size = 10
        min_size = 0
    }

    update_config {
        max_unavailable = 1
    }

    labels = {
        role = "general"
    }

    depends_on = [
        aws_iam_role_policy_attachment.amazone_eks_worker_node_policy,
        aws_iam_role_policy_attachment.amazone_eks_cni_policy,
        aws_iam_role_policy_attachment.amazone_ec2_container_registry_policy
    ]

    # Allow external changes without Terraform plan difference
    lifecycle {
        ignore_changes = [scaling_config[0].desired_size]
    }
}