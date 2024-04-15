terraform {
  backend "s3" {
    bucket         = "terraform-state-file-lu"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "lu-lock"
  }
}
