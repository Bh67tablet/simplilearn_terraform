resource "aws_security_group" "bh67sg" {
 	name 		= var.ec2_parameters.secgroupname
 	description 	= var.ec2_parameters.secgroupname
 	vpc_id 		= var.vpc_id

  // ssh, https, rdp, postgres
  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 2379
    protocol = "tcp"
    to_port = 2380
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = 3389
    protocol = "tcp"
    to_port = 3389
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port = 5432
    protocol = "tcp"
    to_port = 5432
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 6443
    protocol = "tcp"
    to_port = 6443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8080
    protocol = "tcp"
    to_port = 8080
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8443
    protocol = "tcp"
    to_port = 8443
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 8472
    protocol = "tcp"
    to_port = 8472
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 10250
    protocol = "tcp"
    to_port = 10250
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 10257
    protocol = "tcp"
    to_port = 10259
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port = 30000
    protocol = "tcp"
    to_port = 32767
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

  lifecycle {
    create_before_destroy = true
  }
}
