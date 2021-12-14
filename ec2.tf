resource "aws_instance" "web" {
  ami           =  "ami-0ed9277fb7eb570c9"
  instance_type = "t2.micro"
  subnet_id   = aws_subnet.interviewPRIVSN2.id

  tags = {
    Name = "HelloWorld"
  }
}