terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}
provider "yandex" {
  //OAth-token described in separate secure.tf file
  token = "${var.OAuth-token}"
  cloud_id = "${var.cloud_id}"
  folder_id = "${var.folder_id}"
  zone = "${var.zone}"
}
resource "yandex_compute_instance" "srv1" {
  description = "B5.3.7 practice"
  name = "srv1-terr"
  platform_id = "standard-v1"
  zone = "${var.zone}"

  resources {
    cores = 2
    memory = 4
  }
  scheduling_policy {
  preemptible = false
}
  boot_disk {
    initialize_params {
      //image_id = var.os-image-id
      image_id = "${data.yandex_compute_image.lemp-image.id}"
    }
  }
  network_interface {
    subnet_id = "${yandex_vpc_subnet.internal-net1.id}"
    nat = true
  }
  metadata = {
    // ssh-path alsow described in separate secure.tf file
    serial-port-enable = 1
    ssh-keys = "ubuntu:${file(var.ssh-path)}"
  }
}
locals {
  external_ip = ["${yandex_compute_instance.srv1.network_interface.0.nat_ip_address}"]
}
