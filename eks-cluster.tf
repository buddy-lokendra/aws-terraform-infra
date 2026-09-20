# -----------------------------
# EKS Cluster
# Uses the same VPC/public subnets already defined in main.tf
# -----------------------------
resource "aws_eks_cluster" "main" {
  name     = "devops-portfolio-cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = aws_subnet.public[*].id
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_policy
  ]
}
