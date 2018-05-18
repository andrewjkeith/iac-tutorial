resource "aws_instance" "raddit" {
  ami = "ami-e45d6181"
  instance_type = "t2.micro"
  key_name = "working"
  security_groups = [
    "sg-c1836ea9"
  ]
  subnet_id = "subnet-2f0aaf62"
  tags {
    "Name" = "xawsvdrad01"
  }
}
