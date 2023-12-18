output "bh67_sec_group" {
  value   	= aws_security_group.bh67sg.id
  description = "ID of the allow_tls security group"
}
