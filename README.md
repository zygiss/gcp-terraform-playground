# Terraforming the Google Cloud Platform

This repo contains various bits of
[Terraform](https://www.terraform.io/) code to provision resources on
[Google Cloud Platform](https://cloud.google.com/) (GCP), mainly a
Google Compute Instance, together with its associated resources, such as
disk, network interface and provisioning metadata.

We're making use of the [Always Free](https://cloud.google.com/free/)
GCP usage tier and the [12 month, 300USD free
trial](https://cloud.google.com/free/docs/frequently-asked-questions#free-trial)
to minimise the monetary impact of learning how to work with both Terraform
and GCP.

The included Terraform states currently are able to provision the
following resources:

* [static external IP address](https://cloud.google.com/compute/docs/ip-addresses#reservedaddress)
* [virtual machine instance](https://cloud.google.com/compute/docs/instances/).
* [cloud storage](https://cloud.google.com/storage/) bucket, used for storing
  the instance startup script

The following attributes can be customised in the variable file,
`vars.tf`:

* instance name
* instance machine type (default:
  [f1-micro](https://cloud.google.com/compute/docs/machine-types#sharedcore))
* instance region & zone (default:
  [us-west1-a](https://cloud.google.com/compute/docs/regions-zones/regions-zones#available))
* instance maintenance behaviour (default:
  [migrate](https://cloud.google.com/compute/docs/instances/setting-instance-scheduling-options#live_migrate))
* instance restart behavior (default: [automatic
  restart](https://cloud.google.com/compute/docs/instances/setting-instance-scheduling-options#autorestart))
* disk type (default: [standard (HDD) persistent
  disk](https://cloud.google.com/compute/docs/disks/#pdspecs))
* disk image (default: latest [CoreOS Container
  Linux](https://coreos.com/os/docs/latest))
* disk size (default: 30GB)
* disk
  [auto-delete](https://cloud.google.com/compute/docs/disks/add-persistent-disk#updateautodelete)
  property (default: true)
* cloud storage bucket [storage
  class](https://cloud.google.com/storage/docs/storage-classes#overview_of_storage_classes)
  (default: regional)


## Getting started

### Install dependencies

* [Cloud SDK](https://cloud.google.com/sdk/downloads) - we'll use the
  `gcloud` tool for some initial setup since Terraform
  GCP provider doesn't yet have complete feature support.
* [Terraform](https://www.terraform.io/downloads.html)


### Create a GCP project

Terraform GCP provider only supports creating projects that are part of
an Organisation which can only be created by speaking to the Google
sales team and we won't be doing that.  Just navigate to the [GCP
Console](https://console.cloud.google.com) and create a new project.


### Generate credentials & configure GCP authentication in Terraform

Follow the docs
[here](https://www.terraform.io/docs/providers/google/#authentication-json-file)
to configure and download the account file.

Then update the `credentials` like in the included `settings.tf` file
with the name of your credentials file, e.g.
`gce-project-111111111111.json` and enter the correct project ID, e.g.
`111111111111`:

```json
provider "google" {
  credentials = "${file("gce-project-111111111111.json")}"
  project     = "111111111111"
  region      = "us-west1"
}
```

## Run it

You can run `terraform plan` to get the output of what Terraform is
about to do, if anything.  In other words, `terraform plan` will check
the existing state of the environment and prepare any required steps to
make the environment match the configuration.

Once you're happy, let Terraform apply the state:
```
terraform apply
```

And observe the results.
