
data "aws_iam_user" "developer" {
    user_name = "developer"
}

# resource "aws_iam_user" "developer" {
#     name = "developer"
# }

resource "aws_iam_role" "developer" {
    name        = "developer"
    description = "Developer IAM Role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                # Sid    = ""
                Principal = {
                    Service = "ec2.amazonaws.com"
                }
            },
        ]
    })


}

resource "aws_iam_policy" "developer_eks" {
    name        = "AmazoneEKSDeveloperPolicy"
    description = "Policy for developer to access EKS cluster"
    policy      = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = [
                    "eks:DescribeCluster",
                    "eks:ListClusters"
                ]
                Effect   = "Allow"
                Resource = "*"
            },
        ]
    })
}

resource "aws_iam_user_policy_attachment" "developer_eks" {
    user = data.aws_iam_user.developer.user_name
    policy_arn = aws_iam_policy.developer_eks.arn
}
    # user = 
    # policy_arn = aws_iam_policy.developer_eks.arn

# resource "aws_eks_access_entry" "developer" {
#   cluster_name      = aws_eks_cluster.eks.name
#   principal_arn     = aws_iam_user.developer.arn
#   kubernetes_groups = ["my-viewer"]
# #   type              = "STANDARD"
# } 

# resource "aws_iam_access_key" "developer" {
#   user    = aws_iam_user.developer.name
#   pgp_key = "keybase:some_person_that_exists"
# }