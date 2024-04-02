data "yandex_compute_image" "ubuntu" {
  family = "centos-7"
}

resource "yandex_vpc_network" "develop" {
  name = var.vpc_name
}

resource "yandex_vpc_subnet" "develop" {
  name           = var.vpc_name
  zone           = var.default_zone
  network_id     = yandex_vpc_network.develop.id
  v4_cidr_blocks = var.default_cidr
}

resource "yandex_compute_instance" "default" {
  count = length(var.vms)

  name        = "${local.project-name}-${var.env}-${var.vms[count.index].name}"
  platform_id = var.vms[count.index].platform

  resources {
    cores         = var.vms[count.index].cpu
    memory        = var.vms[count.index].memory
    core_fraction = var.vms[count.index].fraction
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
    ssh-keys = "centos:${file("~/.ssh/id_ed25519.pub")}"
  }
}
