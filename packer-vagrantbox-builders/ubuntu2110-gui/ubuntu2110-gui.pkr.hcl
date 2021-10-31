variable "box_version" {
  type    = string
  default = ""
}

source "vagrant" "ubuntu-gui" {
  communicator = "ssh"
  ssh_username = "vagrant"
  ssh_password = "vagrant"
  #disk_size    = 81920
  #headless             = false
  #guest_additions_path = "VBoxGuestAdditions_{{ .Version }}.iso"
  #vboxmanage           = [["modifyvm", "{{ .Name }}", "--memory", "2048"], ["modifyvm", "{{ .Name }}", "--cpus", "1"]]
  #guest_os_type        = "Ubuntu_64"
  #source_path = "bento/ubuntu-21.04"
  source_path        = "bento/debian-11.1-i386"
  provider           = "virtualbox"
  add_force          = true
  output_dir         = "build-output"
  #output_vagrantfile = "{{.Provider}}-ubuntu2004.box"
}

build {
  sources = ["source.vagrant.ubuntu-gui"]
  post-processor "vagrant" {
    keep_input_artifact = true
    provider_override = "virtualbox"
  }
  
}
