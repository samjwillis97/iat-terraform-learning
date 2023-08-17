data "http" "icanhazip" {
  url = "http://icanhazip.com"
}

locals {
  public_ip = var.public_ip == null ? chomp(data.http.icanhazip.body) : var.public_ip
}

output "public_ip" {
  value = local.public_ip
}
