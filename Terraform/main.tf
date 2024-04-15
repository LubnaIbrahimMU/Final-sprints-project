module "EkS" {
  source     = "./modules/EKS"
  subnet_ids = var.subnet_ids
}

module "ECR" {
  source = "./modules/ECR"
}

module "EC2" {
  source            = "./modules/EC2"
  public1_subnet_id = var.public1_subnet_id
  vpc_id            = var.vpc_id
}
