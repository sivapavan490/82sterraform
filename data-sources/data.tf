data "aws_ami" "joindeevops" {
  most_recent      = true
  owners           = ["973714476881"]

  filter {
    name   = "name"
    values = ["RHEL-9-DevOps-Practice"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

# we are taking the ami output using data source 
output "ami_id" {
    value = data.aws_ami.joindeevops.id
}


# here below we are fetching the default vpc of terraform

data "aws_vpc" "default" {
  default = true
}

# o/p for default vpc-id

output "vpc_id" {
    value = data.aws_vpc.default.id
  
}