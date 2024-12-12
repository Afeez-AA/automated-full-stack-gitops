resource "aws_instance" "ec2" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_pair_name
  subnet_id              = aws_subnet.public_subnet.id
  availability_zone      = "us-east-1a"
  vpc_security_group_ids = [aws_security_group.sg.id]
  tags = {

    Name = var.instance_name
  }

}


