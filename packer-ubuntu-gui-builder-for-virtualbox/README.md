## Uploading Vagrantbox to Vagrant Cloud

Refer [Creating a New Vagrant Box](https://www.vagrantup.com/vagrant-cloud/boxes/create)

```shell
curl 'https://vagrantcloud.com/api/v1/box/USERNAME/BOX_NAME/version/VERSION/provider/PROVIDER_NAME/upload?access_token=ACCESS_TOKEN'


curl -X PUT --upload-file foo.box ACCESS_PATH
```


- [Vagrant Cloud API](https://www.vagrantup.com/vagrant-cloud/api#create-a-box)
- [Creating a New Vagrant Box](https://www.vagrantup.com/vagrant-cloud/boxes/create)