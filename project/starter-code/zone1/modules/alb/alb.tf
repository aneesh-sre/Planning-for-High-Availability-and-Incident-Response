resource "aws_lb_target_group" "udacity" {
  name     = "udacity-lb-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }
}

resource "aws_lb_target_group_attachment" "udacity" {
  count            = length(var.ec2)
  target_group_arn = aws_lb_target_group.udacity.arn
  target_id        = var.ec2[count.index]  
  port             = 80
}

resource "aws_lb" "udacity" {
  name               = "udacity-lb-tf"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [var.ec2_sg]
  subnets            = var.subnet_ids  

  enable_deletion_protection = false
}

resource "aws_lb_listener" "udacity" {
  load_balancer_arn = aws_lb.udacity.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.udacity.arn
  }
}
