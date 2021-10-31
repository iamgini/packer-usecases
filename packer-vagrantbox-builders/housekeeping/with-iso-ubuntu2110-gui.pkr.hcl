variable "box_version" {
  type    = string
  default = "0.1.0"
}

source "virtualbox-iso" "ubuntu-gui" {
  boot_command = [
  "<esc><esc><enter><wait>",
  "/install/vmlinuz noapic ",
  "preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg ",
  "debian-installer=en_US auto locale=en_US kbd-chooser/method=us ",
  "hostname={{ .Name }} ",
  "fb=false debconf/frontend=noninteractive ",
  "keyboard-configuration/modelcode=SKIP keyboard-configuration/layout=USA ",
  "keyboard-configuration/variant=USA console-setup/ask_detect=false ",
  "initrd=/install/initrd.gz -- <enter>"
]
  guest_os_type           = "Ubuntu_64"
  communicator = "ssh"
  ssh_username = "vagrant"
  ssh_password = "vagrant"
  ssh_wait_timeout        = "1800s"
  #headless             = false
  #guest_additions_path = "VBoxGuestAdditions_{{ .Version }}.iso"
  #vboxmanage           = [["modifyvm", "{{ .Name }}", "--memory", "2048"], ["modifyvm", "{{ .Name }}", "--cpus", "1"]]
  #guest_os_type        = "Ubuntu_64"
  #source_path = "bento/ubuntu-21.04"
  boot_wait               = "10s"
  disk_size               = 81920
  iso_urls                = ["/Users/gini/Downloads/ubuntu-20.04.3-live-server-amd64.iso"]
  iso_checksum            = "md5:8df52f27204c37a50a169989fb019188"
  shutdown_command        = "echo 'vagrant'|sudo -S shutdown -P now"
  vboxmanage              = [["modifyvm", "{{ .Name }}", "--memory", "1024"], ["modifyvm", "{{ .Name }}", "--cpus", "1"]]
  #virtualbox_version_file = ".vbox_version"
  #vm_name                 = "packer-ubuntu-20.04-amd64"

}

build {
  sources = ["source.virtualbox-iso.ubuntu-gui"]
  post-processor "vagrant" {
    #keep_input_artifact = true
    #provider_override = "virtualbox"
  }
  
}
