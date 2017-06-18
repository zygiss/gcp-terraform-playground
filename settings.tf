provider "google" {
  credentials = "${file("gce-project-111111111111.json")}"
  project     = "111111111111"
  region      = "us-west1"
}
