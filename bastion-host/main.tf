resource "aws_instance" "this" {
  ami                     = var.ami_id
  instance_type           = "t3.micro"
  vpc_security_group_ids  = [data.aws_ssm_parameter.bastion_sg.value]
  subnet_id               = local.public_subnet_id



  # 20GB is not enough
   root_block_device {
    volume_size = 50  # Set root volume size to 50GB
    volume_type = "gp3"  # Use gp3 for better performance (optional)
  }

  
  tags = merge(
    var.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-bastion"
    }
  )
}