# Set the provider to AWS
provider "aws" {
  region = "us-west-2"
}

# Create a security group
resource "aws_security_group" "example" {
  name_prefix = "example"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "example-key"
  security_groups = [aws_security_group.example.name]

  tags = {
    Name = "example-instance"
  }
}
