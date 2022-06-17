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
  boot_disk {
    initialize_params {
      image_id = var.os-image-id
    }
  }
  network_interface {
    subnet_id = "${yandex_vpc_subnet.internal-net1.id}"
  }
}

/*
---------------------------------------------------------------------
resource "yandex_compute_instance" "default" {
  name        = "test"
  platform_id = "standard-v1"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 4
  }

  boot_disk {
    initialize_params {
      image_id = "image_id"
    }
  }

  network_interface {
    subnet_id = "${yandex_vpc_subnet.foo.id}"
  }

  metadata = {
    foo      = "bar"
    ssh-keys = "ubuntu:${file("~/.ssh/id_rsa.pub")}"
  }
}
*/

