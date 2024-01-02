provider "aws" {
    region = "us-east-1"
  
}



resource "aws_security_group" "sg_allow_ssh" {
  name        = "sg_allow_ssh"
  description = "allow port 22"

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
resource "aws_instance" "myjiresserver" {
    ami = "ami-079db87dc4c10ac91"
    instance_type = "t2.micro"
    key_name = "dpp"
    security_groups = ["sg_allow_ssh"]

  
}
