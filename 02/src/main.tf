resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}
resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

metadata = {
   serial-port-enable = var.vms_ssh_root_key.serial-port-enable
   ssh-keys           = var.vms_ssh_root_key.ssh-keys
  }
}

resource "yandex_compute_instance" platform-db" {


data "yandex_compute_image" "ubuntu" {
#  family = "ubuntu-2004-lts"
   family =  var.vm_web_image
}
resource "yandex_compute_instance" "platform" {
  name        = "netology-develop-platform-web"
  platform_id = "standard-v2"
  resources {
     cores         = var.vm_web_cores
     memory        = var.vm_web_mem
     core_fraction = var.vm_web_frac

#    cores         = 2
#    memory        = 1
#    core_fraction = 5
  }
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.ubuntu.image_id
    }
  }
  scheduling_policy {
    preemptible = true
  }
  network_interface {
    subnet_id = yandex_vpc_subnet.develop.id
    nat       = true
  }

  metadata = {
    serial-port-enable = 1
    ssh-keys           = "ubuntu:${var.vms_ssh_root_key}"
  }

}
