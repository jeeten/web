resource "aws_ecr_repository" "my_repo" {
  name = "web_app"
  image_tag_mutability = "MUTABLE"
#  image_scanning_configuration {
#    scan_on_push = true
#  }
}

resource "aws_ecr_lifecycle_policy" "my_repo_policy" {
  repository = aws_ecr_repository.my_repo.name

  policy = jsonencode({
    "rules" : [
      {
        "rulePriority" : 1,
        "description" : "Expire images older than 14 days",
        "selection" : {
          "tagStatus" : "tagged",
#          "countType" : "sinceImagePushed",
          "tagPrefixList" : ["v"],
          "countType": "imageCountMoreThan"
#          "countUnit" : "days",
          "countNumber" : 14
        },
        "action" : {
          "type" : "expire"
        }
      }
    ]
  })
}