
resource "aws_instance" "web" {
  ami                    = data.aws_ami.joindeevops.id 
  # we are gettng ami_id dynamiclly by using data-sources
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.securitygroup_creation.id] # refering security group resource into instance resource

  tags = {
    Name = "HelloWorld"
  }
}



resource "aws_security_group" "securitygroup_creation" {
  name        = "siva" # security group name
  description = "Allow TLS inbound traffic and all outbound traffic"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "pavan" # name

  }
}

