resource "local_file" "nginx" {
  content = templatefile("${path.module}/nginx.conf.tftpl", {
    nginx_port   = 80,
    server_name  = "jmaz.consulting",
    backend_ip   = "10.77.30.5",
    backend_port = 8080
  })
  filename = "${path.module}/nginx.conf"
}

resource "local_file" "dns" {
  content = templatefile("${path.module}/resolv.conf.tftpl", {
    dns_ips = ["8.8.8.8", "4.4.4.4", "10.77.0.5"]
  })
  filename = "${path.module}/resolv.conf"
}

resource "local_file" "dns_two" {
  content = templatefile("${path.module}/resolv_map.conf.tftpl", {
    dns = {
      google     = "8.8.8.8"
      cloudflare = "1.1.1.1"
      local      = "127.0.0.1"
    }
  })
  filename = "${path.module}/resolv_map.conf"
}
