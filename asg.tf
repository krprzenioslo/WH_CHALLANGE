data "aws_ami" "latest_amzn2_ami" {
  owners = [
  "amazon"]
  most_recent = true

  filter {
    name = "name"
    values = [
    "amzn2-ami-hvm-*-x86_64-ebs"]
  }
}

data "template_file" "httpd_template" {
  template = file("${path.module}/templates/httpd.sh")
  vars = {
    port = var.httpd_port
  }
}

resource "aws_launch_template" "wh_challange_template" {
  image_id               = data.aws_ami.latest_amzn2_ami.image_id
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.asg_sg.id]
  user_data              = base64encode(data.template_file.httpd_template.rendered)
}

resource "aws_autoscaling_group" "wh_challange_asg" {
  name               = "wh-challange"
  availability_zones = var.availability_zones
  desired_capacity   = 2
  max_size           = 2
  min_size           = 2

  launch_template {
    id      = aws_launch_template.wh_challange_template.id
    version = "$Latest"
  }
  target_group_arns = [
  aws_lb_target_group.wh_challange_tg.arn]
}

resource "aws_autoscaling_schedule" "scale_in" {
  scheduled_action_name  = "scale-in"
  min_size               = 0
  max_size               = 0
  desired_capacity       = 0
  recurrence             = "0 18 * * 1-5"
  time_zone              = "CET"
  autoscaling_group_name = aws_autoscaling_group.wh_challange_asg.name
}

resource "aws_autoscaling_schedule" "scale_out" {
  scheduled_action_name  = "scale-out"
  min_size               = 2
  max_size               = 2
  desired_capacity       = 2
  recurrence             = "0 8 * * *"
  time_zone              = "CET"
  autoscaling_group_name = aws_autoscaling_group.wh_challange_asg.name
}
