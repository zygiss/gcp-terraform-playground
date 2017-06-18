resource "google_compute_instance" "default" {
  name         = "${lookup(var.instance, "name")}"
  machine_type = "${lookup(var.instance, "machine_type")}"
  zone         = "${lookup(var.instance, "zone")}"

  disk {
    image       = "${lookup(var.disk, "image")}"
    auto_delete = "${lookup(var.disk, "auto_delete")}"
    type        = "${lookup(var.disk, "type")}"
    size        = "${lookup(var.disk, "size")}"
  }

  metadata {
    salt_master = "${lookup(var.metadata, "salt_master")}"
    hostname    = "${replace(var.instance["name"], "-", ".")}"

    #startup_script = "${lookup(var.metadata, "startup_script")}"
    startup_script = "gs://${lookup(var.bucket, "name")}/${var.startup_script}"
  }

  network_interface {
    network = "default"

    access_config {
      nat_ip = "${google_compute_address.default.address}"
    }
  }

  scheduling {
    on_host_maintenance = "${lookup(var.scheduling, "on_host_maintenance")}"
    automatic_restart   = "${lookup(var.scheduling, "automatic_restart")}"
  }
}
