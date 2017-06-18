resource "google_compute_address" "default" {
  name   = "${lookup(var.instance, "name")}"
  region = "${lookup(var.instance, "region")}"
}
