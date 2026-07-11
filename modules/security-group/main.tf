resource "aws_security_group" "web_sg" {

  name = "${var.environment}-web-sg"

  description = "Security group for web server"

  vpc_id = var.vpc_id


  ingress {

    description = "SSH Access"

    from_port = 22

    to_port = 22

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }


  ingress {

    description = "HTTP Access"

    from_port = 80

    to_port = 80

    protocol = "tcp"

    cidr_blocks = ["0.0.0.0/0"]
  }


  egress {

    from_port = 0

    to_port = 0

    protocol = "-1"

    cidr_blocks = ["0.0.0.0/0"]
  }


  tags = {

    Name = "${var.environment}-web-sg"
  }
}