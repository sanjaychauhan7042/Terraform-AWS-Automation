
resource "aws_instance" "main" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = aws_subnet.subnet1.id
    vpc_security_group_ids = [ aws_security_group.main.id ]
    associate_public_ip_address = true
    user_data = base64encode(file("userdata.sh"))

    tags = {
        Name = "main-instance"
    }
  
}

resource "aws_instance" "main1" {
    ami = var.ami
    instance_type = var.instance_type
    subnet_id = aws_subnet.subnet2.id
    vpc_security_group_ids = [ aws_security_group.main.id ]
    associate_public_ip_address = true
    user_data = base64encode(file("userdata1.sh"))

    tags = {
        Name = "main-instance1"
    }
  
}


