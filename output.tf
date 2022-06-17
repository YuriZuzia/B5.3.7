output "default-net-id" {
value = yandex_vpc_network.def-net.id  
}
output "srv1-id" {
    value = yandex_compute_instance.srv1.id  
}
output "srv1-ip" {
  value = local.external_ip
}
output "lemp-image-name" {
    value = data.yandex_compute_image.lemp-image.name
}
output "lemp-image-id" {
    value = data.yandex_compute_image.lemp-image.id
}