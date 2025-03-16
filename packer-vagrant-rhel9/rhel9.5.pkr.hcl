variable "iso_url" {
  default = "./rhel9.5.iso"
}

variable "iso_checksum" {
  default = "SHA256:<checksum>"  # Replace with actual checksum
}

source "virtualbox-iso" "rhel9" {
  iso_url            = var.iso_url
  iso_checksum       = var.iso_checksum
  iso_checksum_type  = "sha256"
  boot_command       = [
    "<tab> inst.text inst.ks=http://{{ .HTTPIP }}:{{ .HTTPPort }}/ks.cfg<enter>"
  ]
  http_directory     = "http"
  guest_os_type      = "RedHat_64"
  disk_size          = 20480
  memory            = 2048
  cpus              = 2
  shutdown_command  = "sudo shutdown -h now"
}

build {
  sources = ["source.virtualbox-iso.rhel9"]

  post-processor "vagrant" {
    output = "rhel9.5.box"
  }
}
