resource "aws_instance" "instance" {
  ami           = var.ubuntu_ami
  instance_type = var.instance_type
  subnet_id     = var.public_subnet_ids[0] 
  associate_public_ip_address = true       

  vpc_security_group_ids = [var.security_group_id]
  key_name              = var.key_name

  root_block_device {
    volume_size = 30
    volume_type = "gp3"
  }

  tags = {
    Name        = "${var.environment}-ansible-master"
    Environment = var.environment
  }
}