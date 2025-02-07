#create EC2 instances
resource "aws_instance" "expense" {
  count = length(var.instances)
  # count =3
  ami                    = "ami-09c813fb71547fc4f"
  vpc_security_group_ids = [aws_security_group.allow_tls.id]
  instance_type          = "t2.micro"
  /*tags = {
    Name = var.instances[count.index]
  }*/
  tags = merge(
    var.common_tags,
    {
        Name = "${var.project}-${var.environment}-${var.instances[count.index]}" #expense-dev-mysql
    }
  )
} 

#create security group

resource "aws_security_group" "allow_tls" {
  name        = "${var.project}-${var.environment}"
  description = "Allow TLS inbound traffic and allow outbound traffic"

  ingress {
    from_port   = 22            #all ports
    to_port     = 22            #all ports
    protocol    = "tcp"         # -1 means all protocols like tcp http https
    cidr_blocks = ["0.0.0.0/0"] # all IP address
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project}-${var.environment}"
  }
}    