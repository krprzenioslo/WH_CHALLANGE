resource "aws_lb" "wh_challange_nlb" {
  name               = "wh-challange"
  internal           = false
  load_balancer_type = "network"
  subnets            = var.subnets_ids
}

resource "aws_lb_listener" "wh_challange_listener" {
  load_balancer_arn = aws_lb.wh_challange_nlb.arn
  port              = "80"
  protocol          = "TCP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.wh_challange_tg.arn
  }
}



resource "aws_lb_target_group" "wh_challange_tg" {
  name               = "wh-challange-tg"
  port               = var.httpd_port
  protocol           = "TCP"
  target_type        = "instance"
  preserve_client_ip = true
  vpc_id             = var.vpc_id
}
