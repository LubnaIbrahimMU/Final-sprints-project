terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# provider "kubernetes" {
#   config_path    = "~/.kube/config"
#   config_context = "my-context"
# }

# resource "kubernetes_namespace" "example" {
#   metadata {
#     name = "my-first-namespace"
#   }
# }


provider "aws" {
  region = "us-east-1"
}
