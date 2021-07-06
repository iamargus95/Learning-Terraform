provider "google" {
    credentials = "${file("cred.json")}"
    project = "home-258016"
    region = "us-east1"
    zone = "us-east1-b"
}

resource "google_compute_instance" "my-server" {
    name = "my-ubuntults"
    machine_type = "f1-micro"

    boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-2004-lts"
    }
  }

  network_interface {
      network = "default"
      access_config {
        
      }
  }
}