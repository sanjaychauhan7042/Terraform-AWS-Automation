resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr_block
    instance_tenancy = "default"

    tags = {
        Name = "main-vpc"
    }
  
}

resource "aws_subnet" "subnet1" {
    vpc_id            = aws_vpc.main.id
    cidr_block        = var.subnet1_cidr_block
    availability_zone = var.availability_zone1
    map_public_ip_on_launch = true

    tags = {
        Name = "subnet1"
    }
}
resource "aws_subnet" "subnet2" {
    vpc_id            = aws_vpc.main.id
    cidr_block        = var.subnet2_cidr_block
    availability_zone = var.availability_zone2
    map_public_ip_on_launch = true

    tags = {
        Name = "subnet2"
    }
}


resource "aws_internet_gateway" "main" {
    vpc_id = aws_vpc.main.id

    tags = {
        Name = "main-igw"
    }
  
}

resource "aws_route_table" "main" {
    vpc_id = aws_vpc.main.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.main.id
    }
  
}


resource "aws_route_table_association" "main" {
    subnet_id      = aws_subnet.subnet1.id
    route_table_id = aws_route_table.main.id    
}

resource "aws_route_table_association" "main1" {
    subnet_id      = aws_subnet.subnet2.id
    route_table_id = aws_route_table.main.id
}


resource "aws_security_group" "main" {
  vpc_id = aws_vpc.main.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "main-sg"
  }
}


