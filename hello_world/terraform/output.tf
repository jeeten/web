output "id" {
  value = aws_ecr_repository.my_repo.id
}

output "arn" {
  value = aws_ecr_repository.my_repo.arn
}

output "name" {
  value = aws_ecr_repository.my_repo.name
}

output "registry_id" {
  value = aws_ecr_repository.my_repo.registry_id
}
output "repository_url" {
  value = aws_ecr_repository.my_repo.repository_url
}
output "tags" {
  value = aws_ecr_repository.my_repo.repository_url
}

output "JumpHost" {
  value = aws_instance.my_instance.public_ip
}

output "EKS_Cluster" {
  value = aws_eks_cluster.eks.name
}
