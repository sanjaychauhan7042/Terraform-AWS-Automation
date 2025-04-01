

resource "aws_lb" "main" {
  name               = "myalb"
  internal           = false
  load_balancer_type = "application"
  
  security_groups = [aws_security_group.main.id]
  subnets         = [aws_subnet.subnet1.id, aws_subnet.subnet2.id]

  tags = {
    Name = "web"
  }
}

resource "aws_lb_target_group" "main" {
  name     = "myTG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.main.id

  health_check {
    path = "/"
    port = "traffic-port"
  }
}

resource "aws_lb_target_group_attachment" "main" {
  target_group_arn = aws_lb_target_group.main.arn
  target_id        = aws_instance.main.id
  port             = 80
}

resource "aws_lb_target_group_attachment" "main1" {
  target_group_arn = aws_lb_target_group.main.arn
  target_id        = aws_instance.main1.id
  port             = 80
}


resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    target_group_arn = aws_lb_target_group.main.arn
    type             = "forward"
  }
}


