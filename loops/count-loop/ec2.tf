
resource "aws_instance" "expense" {
  count = 3
  ami                    = var.ami_id
  instance_type          = var.environment == "prod" ? "t3.small" :"t2.micro"
  vpc_security_group_ids = [aws_security_group.securitygroup_creation.id] # refering security group resource into instance resource

  tags = {
    
    Name = var.instances[count.index]
}
}


resource "aws_security_group" "securitygroup_creation" {
  name        = "backend" # security group name
  description = "Allow TLS inbound traffic and all outbound traffic"
  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = "tcp"
    cidr_blocks = var.cidr_blocks

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = var.sg_tags
}

d