resource "yandex_vpc_network" "def-net" {
  name = "def-network"
}
resource "yandex_vpc_subnet" "internal-net1" {
  name = "int-subnet"
  zone = var.zone
  v4_cidr_blocks = ["10.0.0.0/24"]
  network_id = "${yandex_vpc_network.def-net.id}"  
}


/*
resource "yandex_vpc_network" "lab-net" {
  name = "lab-network"
}

resource "yandex_vpc_subnet" "lab-subnet-a" {
  v4_cidr_blocks = ["10.2.0.0/16"]
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.lab-net.id}"
}
*/
