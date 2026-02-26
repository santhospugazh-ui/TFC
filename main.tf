data "aws_vpc" "existing" {
  id = var.vpc_id
}

data "aws_subnet" "subnet_existing" {
  id = var.subnet_id
}

resource "aws_subnet" "subnet_existing1" {
  vpc_id    = data.aws_vpc.existing.id
  subnet_id = data.aws_subnet.subnet_existing1.id
}

resource "aws_security_group" "sg" {
  vpc_id = aws_vpc.main.id

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
}
