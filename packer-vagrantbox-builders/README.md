## Uploading Vagrantbox to Vagrant Cloud

Refer [Creating a New Vagrant Box](https://www.vagrantup.com/vagrant-cloud/boxes/create)

```shell
curl 'https://vagrantcloud.com/api/v1/box/USERNAME/BOX_NAME/version/VERSION/provider/PROVIDER_NAME/upload?access_token=ACCESS_TOKEN'


curl -X PUT --upload-file foo.box ACCESS_PATH
```


- [Vagrant Cloud API](https://www.vagrantup.com/vagrant-cloud/api#create-a-box)
- [Creating a New Vagrant Box](https://www.vagrantup.com/vagrant-cloud/boxes/create)

**Enabling Log**

```shell
PACKER_LOG=1 your_packer_command
```

**Virtual Machine Disk Cleanup **

To make the smallest disk size.

```shell
echo "==> Clean up yum cache of metadata and packages to save space"
yum -y --enablerepo='*' clean all

echo "==> Clear core files"
rm -f /core*

echo "==> Removing temporary files used to build box"
rm -rf /tmp/*

echo '==> Zeroing out empty area to save space in the final image'
dd if=/dev/zero of=/EMPTY bs=1M
rm -f /EMPTY
```


```shell
sudo apt-get clean
sudo dd if=/dev/zero of=/EMPTY bs=1M
sudo rm -f /EMPTY
cat /dev/null > ~/.bash_history && history -c && exit
```


```shell
## Get running VM List
vboxmanage list runningvms

## Package the box using vagrant package
vagrant package --base "Debian-base" --output debian.box
```


## References

- [Building VM images with Ansible and Packer](https://www.jeffgeerling.com/blog/server-vm-images-ansible-and-packer)
- [geerlingguy/ansible-role-packer-debian](https://github.com/geerlingguy/ansible-role-packer-debian)
- [geerlingguy/ansible-role-packer](https://github.com/geerlingguy/ansible-role-packer)
- [geerlingguy/ansible-role-packer_rhel](https://github.com/geerlingguy/ansible-role-packer_rhel)
- [geerlingguy/packer-boxes](https://github.com/geerlingguy/packer-boxes)


**Housekeeping**


```
  post-processors {
    post-processor "vagrant" {
      provider_override = "virtualbox"
      #keep_input_artifact = true
      #provider_override = "virtualbox"
      #output = packer_{{.BuildName}}_{{.Provider}}.box
      #"build-output/{{.Provider}}-ubuntu2004.box"
    }
  }
```