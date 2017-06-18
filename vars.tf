variable "instance" {
  default = {
    name         = "node1-example-net"
    machine_type = "f1-micro"
    region       = "us-west1"
    zone         = "us-west1-a"
  }
}

variable "disk" {
  default = {
    image       = "centos-7-v20170523"
    auto_delete = true
    type        = "pd-standard"
    size        = "30"
  }
}

variable "scheduling" {
  default = {
    on_host_maintenance = "MIGRATE"
    automatic_restart   = true
  }
}

variable "metadata" {
  default = {
    salt_master    = "salt.example.net"
    salt_transport = "tcp"
  }
}

variable "bucket" {
  default = {
    name          = "example-gcp"
    storage_class = "REGIONAL"
  }
}

variable "startup_script" {
  default = "startup_script.sh"
}
