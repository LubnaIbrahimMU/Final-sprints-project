#Create EC2
resource "aws_instance" "lu-sprints" {
  ami                         = "ami-0557a15b87f6559cf"
  instance_type               = "t2.micro"
#   user_data                   = file(var.script)
  subnet_id                   = var.public1_subnet_id
  key_name                    = "sprint"
  associate_public_ip_address = true
  vpc_security_group_ids  = ["${aws_security_group.sg.id}"]
  iam_instance_profile        = aws_iam_instance_profile.ec2_profile_jenkins.name

  depends_on = [
    aws_iam_role_policy_attachment.amazon_eks_worker_node_policy_general,
    aws_iam_role_policy_attachment.amazon_eks_cni_policy_general,
    aws_iam_role_policy_attachment.amazon_ec2_container_registry_read_only,
  ]
  provisioner "local-exec" {
    command = "echo '[default]' > ../ansible/inventory"
  } 
  provisioner "local-exec" {
    command = "echo '${self.public_ip}' >> ../ansible/inventory"
  }
  provisioner "local-exec" {
      command = "ansible-playbook -i inventory ../ansible/app.yml"
    }

}

