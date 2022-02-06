resource "aws_security_group" "asg_sg" {
  name        = "wh-challange-sg"
  description = "Allow traffic from nlb to asg"
  vpc_id      = var.vpc_id
}

resource "aws_security_group_rule" "allow_traffic_from_client_to_asg" {
  type              = "ingress"
  from_port         = var.httpd_port
  to_port           = var.httpd_port
  protocol          = "tcp"
  cidr_blocks       = [var.client_ip_cidr]
  security_group_id = aws_security_group.asg_sg.id
}


resource "aws_security_group_rule" "allow_traffic_from_nlb_to_asg" {
  type              = "ingress"
  from_port         = var.httpd_port
  to_port           = var.httpd_port
  protocol          = "tcp"
  cidr_blocks       = [var.vpc_cidr]
  security_group_id = aws_security_group.asg_sg.id
}

#Allow EC2 instance to use yum
resource "aws_security_group_rule" "allow_traffic_from_asg_to_world" {
  type              = "egress"
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.asg_sg.id
}