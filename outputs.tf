output "aws_vpc_main" {
  value = aws_vpc.demo_main_vpc.id
}

output "aws_subnet_public" {
  value = aws_submet.public_subnet_01.id
}
output "aws_subnet_public"
  value = aws_subnet.private_subnet_01.id
}

output "instance_ips" {
  value = aws_instance.web.*.public_ip
}
