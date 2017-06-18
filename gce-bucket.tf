resource "google_storage_bucket" "default" {
  name          = "${lookup(var.bucket, "name")}"
  location      = "${lookup(var.instance, "region")}"
  storage_class = "${lookup(var.bucket, "storage_class")}"
}

resource "google_storage_bucket_object" "default" {
  name   = "startup_script"
  bucket = "${lookup(var.bucket, "name")}"
  source = "${var.startup_script}"
}
