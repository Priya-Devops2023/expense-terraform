output "vpc_id" {
  value = aws_vpc.main.id
}
output "public_subnet_ids" {
  value = aws_subnet.public.*.id
}
output "web_subnet_ids" {
  value = aws_subnet.web.*.id
}
output "app_subnet_ids" {
  value = aws_subnet.app.*.id
}
output "db_subnet_ids" {
  value = aws_subnet.db.*.id
}

