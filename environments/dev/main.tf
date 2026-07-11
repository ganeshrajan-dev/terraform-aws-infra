module "vpc" {

  source = "D:/terraform-devops-project/modules/vpc"

  vpc_cidr = var.vpc_cidr

  public_subnet_cidr = var.public_subnet_cidr

  availability_zone = var.availability_zone

  environment = var.environment

}


module "sg" {
  source      = "D:/terraform-devops-project/modules/security-group"
  vpc_id      = module.vpc.vpc_id
  environment = var.environment
}


module "ec2" {

  source = "D:/terraform-devops-project/modules/ec2"

  instance_type = var.instance_type

  ami_id = data.aws_ami.ubuntu.id

  subnet_id = module.vpc.public_subnet_id

  environment = var.environment

  security_group_id = module.sg.web_sg

  key_name = var.key_name


}


data "aws_ami" "ubuntu" {

  most_recent = true

  owners = ["099720109477"]

  filter {
    name = "name"

    values = ["ubuntu/images/hvm-ssd-gp3/ubuntu-noble-24.04-amd64-server-*"]
  }
  filter {
    name = "virtualization-type"

    values = ["hvm"]
  }

}