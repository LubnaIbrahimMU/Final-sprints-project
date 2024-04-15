resource "aws_eks_cluster" "eks_cluster" {
  name     = "eks_cluster"
  role_arn = aws_iam_role.eks_cluster.arn


  vpc_config {
    
    subnet_ids = var.subnet_ids
  }

  depends_on = [aws_iam_policy_attachment.eks_cluster_policy]

}



