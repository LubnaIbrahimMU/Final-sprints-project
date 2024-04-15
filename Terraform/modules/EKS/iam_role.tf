resource "aws_iam_role" "eks_cluster" {
  name = "eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_policy_attachment" "eks_cluster_policy" {
  name       = "eks-cluster-policy"
  roles      = [aws_iam_role.eks_cluster.name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

    


###ArgoCD

###not to use now

# resource "kubernetes_secret" "dev-green-argocd" {
#   # this secret gets deployed on CI cluster
#   # to allow ArgoCD to access the new cluster
#   provider = kubernetes.ci

#   metadata {
#     labels = {
#       "argocd.argoproj.io/secret-type" = module.cluster_green.eks_cluster.name
#     }
#     name      = module.cluster_green.eks_cluster.name
#     namespace = "argocd"
#   }

#   data = {
#     server = module.cluster_green.eks_cluster.endpoint
#     name   = module.cluster_green.eks_cluster.name
#     config = <<CONFIG
# {
#     "awsAuthConfig": {
#         "clusterName": "${module.cluster_green.eks_cluster.name}",
#         "roleARN": "${module.base.admin_role.arn}"
#     },
#     "tlsClientConfig": {
#         "insecure": false,
#         "caData": "${module.cluster_green.eks_cluster.certificate_authority.0.data}"
#     }
# }
# CONFIG
#   }
# }


