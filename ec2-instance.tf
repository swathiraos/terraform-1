resource "aws_instance" "ec2" {
    ami = "ami-0b9064170e32bde34"
    instance_type = "t2.micro"
}