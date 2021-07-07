terraform {
    required_version = ">=0.12"
}

resource "google_compute_instance" "webserver" {
  name = var.name
  machine_type = var.machine_type
    boot_disk {
      initialize_params {
          image = var.image
      }
    }

    network_interface {
      network = var.network
      access_config{}
    }
}
