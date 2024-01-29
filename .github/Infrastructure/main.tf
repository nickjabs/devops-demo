provider "aws" {
  region = var.aws_region  

variable "aws_region" {
  type    = string
  default = "eu-central-1"
}

resource "aws_instance" "pimcore_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  
  instance_type = "t2.micro"               

  tags = {
    Name = "Pimcore-Run"
  }
}

output "pimcore_instance" {
  value = aws_instance.pimcore_instance.public_ip
}
