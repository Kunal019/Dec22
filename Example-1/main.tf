# EC2 instances for webservers

resource "aws_instance" "webservers" {
  count           = "${length(var.web_subnets_cidr)}"
  ami             = "${var.ami}"
  instance_type   = "${var.instance_class}"
  security_groups = ["${aws_security_group.webserver_sg.id}"]
  subnet_id       = "${element(aws_subnet.web.*.id,count.index)}"

  tags = {
    Name = "${element(var.webserver_name,count.index)}"
  }
}

# security group for webservers

resource "aws_security_group" "webserver_sg" {
  name        = "allow_http"
  description = "Allow http inbound traffic"
  vpc_id      = "${aws_vpc.default.id}"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}



# application load balancer

resource "aws_lb" "weblb" {
  name               = "${var.elb_name}"
  load_balancer_type = "application"
  security_groups    = ["${aws_security_group.webserver_sg.id}"]
  #subnets            = ["${aws_subnet.web.*.id}"]
  #count = length(var.web_subnets_cidr)
  #subnet_ids     = [tolist(aws_subnet.web[count.index])]

}

# load balancer target group

resource "aws_lb_target_group" "alb_group" {
  name     = "${var.target_group}"
  port     = "${var.target_group_port}"
  protocol = "${var.target_group_protocol}"
  vpc_id   = "${aws_vpc.default.id}"
}

#ELB listeners

resource "aws_lb_listener" "webserver-lb" {
  load_balancer_arn = "${aws_lb.weblb.arn}"
  port              = "${var.listener_port}"
  protocol          = "${var.listener_protocol}"

  # certificate_arn  = "${var.certificate_arn_user}"
  default_action {
    target_group_arn = "${aws_lb_target_group.alb_group.arn}"
    type             = "forward"
  }
}

#ELB listener rules

resource "aws_lb_listener_rule" "allow_all" {
  listener_arn = "${aws_lb_listener.webserver-lb.arn}"

  action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.alb_group.arn}"
  }
  
  condition {
    path_pattern {
      values = ["/static/*"]
    }
    }

}