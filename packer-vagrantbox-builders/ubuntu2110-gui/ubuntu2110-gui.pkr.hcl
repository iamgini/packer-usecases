variable "box_version" {
  type    = string
  default = ""
}

source "vagrant" "ubuntu-gui" {
  communicator         = "ssh"
  ssh_username         = "vagrant"
  ssh_password         = "vagrant"
  #headless             = false
  #guest_additions_path = "VBoxGuestAdditions_{{ .Version }}.iso"
  #vboxmanage           = [["modifyvm", "{{ .Name }}", "--memory", "2048"], ["modifyvm", "{{ .Name }}", "--cpus", "1"]]
  #guest_os_type        = "Ubuntu_64"
  source_path          = "bento/ubuntu-21.04"
  provider             = "virtualbox"
  add_force            = true
}

build {
  sources = ["source.vagrant.ubuntu-gui"]

  post-processors {
    post-processor "vagrant" {
      output = "builds/{{.Provider}}-ubuntu2004.box"
    }

  }
}
