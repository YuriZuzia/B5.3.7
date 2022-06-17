output "default-net-id" {
value = yandex_vpc_network.def-net.id  
}
output "srv1-id" {
    value = yandex_compute_instance.srv1.id  
}