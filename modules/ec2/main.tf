
resource "aws_instance" "web" {

  for_each = {

    web1 = {
      instance_type = "t2.small"
    }

    web2 = {
      instance_type = "t2.nano"
    }
  }

  ami = var.ami_id

  instance_type = each.value.instance_type

  subnet_id = var.subnet_id

  vpc_security_group_ids = [var.security_group_id]

  key_name = var.key_name

  associate_public_ip_address = true

  tags = {

    Name = "${var.environment}-${each.key}"
  }
}