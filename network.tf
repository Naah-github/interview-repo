resource "aws_vpc" "interviewVPC" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "interviewVPC"
  }
}

resource "aws_subnet" "interviewVPCPUBSN" {
  vpc_id     = aws_vpc.interviewVPC.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "interviewVPCPUBSN"
  }
}

resource "aws_route_table" "interviewVPCRT" {
  vpc_id = aws_vpc.interviewVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  

  tags = {
    Name = "interviewVPCRT"
  }
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.interviewVPC.id

  tags = {
    Name = "igw"
  }
}

resource "aws_route_table_association" "a" {
  subnet_id      = aws_subnet.interviewVPCPUBSN.id
  route_table_id = aws_route_table.interviewVPCRT.id
}

resource "aws_subnet" "interviewVPCPUBSN2" {
  vpc_id     = aws_vpc.interviewVPC.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "interviewVPCPUBSN2"
  }
}

resource "aws_route_table" "interviewVPCRT2" {
  vpc_id = aws_vpc.interviewVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  

  tags = {
    Name = "interviewVPCRT2"
  }
}



resource "aws_route_table_association" "a2" {
  subnet_id      = aws_subnet.interviewVPCPUBSN.id
  route_table_id = aws_route_table.interviewVPCRT.id
}

resource "aws_subnet" "interviewPRIVSN" {
  vpc_id     = aws_vpc.interviewVPC.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "interviewPRIVSN"
  }
}

resource "aws_route_table" "interviewVPCRT1" {
  vpc_id = aws_vpc.interviewVPC.id
 
  tags = {
    Name = "interviewVPCRT1"
  }
}

resource "aws_route_table_association" "interviewPRIVSS" {
  subnet_id      = aws_subnet.interviewPRIVSN.id
  route_table_id = aws_route_table.interviewVPCRT.id
}

resource "aws_subnet" "interviewPRIVSN2" {
  vpc_id     = aws_vpc.interviewVPC.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "interviewPRIVSN2"
  }
}

resource "aws_route_table" "interviewVPCRT4" {
  vpc_id = aws_vpc.interviewVPC.id
 
  tags = {
    Name = "interviewVPCRT4"
  }
}

resource "aws_route_table_association" "interviewPRIVSS4" {
  subnet_id      = aws_subnet.interviewPRIVSN2.id
  route_table_id = aws_route_table.interviewVPCRT4.id
}