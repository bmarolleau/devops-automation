variable "ibmcloud_api_key" {
    description = "Denotes the IBM Cloud API key to use"
    default="QdRGJQk6u9HerlPhC82ozmBdbju6qDC3aUY6MJZE3X0w"
}

variable "ibmcloud_region" {
    description = "Denotes which IBM Cloud region to connect to"
    default     = "us-south"
}

variable "ibmcloud_zone" {
    description = "Denotes the zone within the region to connect to (only needed for multi-zone regions--e.g., eu-de-1)"
    default     = "us-south"
}

variable "power_instance_id" {
    description = "Power Virtual Server instance ID associated with your IBM Cloud account (note that this is NOT the API key)"
    default  =  "f0f71cbe-7997-4924-8321-7f876a494973"
}

variable "powerinstancename" {
  default = "Power Systems Virtual Server-Service-MOP-Europe-1" 
  description = "Power Instance associated with the account"
}

variable "imagename" {
  description = "Name of the image key to be used"
  default = "DROPS-IBMI"
}

variable "rsgroup" {
  description = "Resource group name"
  default = "Test1"
}

variable "instance_location" {
  description = "Location or Zone"
  default = "eu-de-2"
}

variable "instancename" {
  default = "dropsdemoinstance"
  description = "Name of the instance"
}

variable "sshkeyname" {
  default = "dropskey"
  description = "Name of the ssh key to be used"
}

variable "sshkey" {
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAABJQAAAQEAoYt8rQApsHbaICqdCBW1fGl0ZX14brYJ/VwO6rqAcF6n5OW1dT+QvnUTEZvLVv4aHLHhcXJ7DdOfchmQgN8Pj53ZcPiitoIR6oJYRE1UuX5GED+fFGV3vdSJBaLhXwttbipzmjU4hBX6aOJsEy05AVZxqzIUWfHybmlmDBsmCkPg8LGBTLUGlt1LjjiovwBuvkEtXC8IkdtZPfrdM9dLmAjAVLKXeNElC3avBqbiFzCR+YzVsSIbH2Dj7PRe8nhxIJS3bZCig9/b1RLm8JVSUnkiZmo5va3gnozF7a4wjozH1xuYT9O84HEgrXvTSftJF0wV7DlKWS1J693GcpowrQ== rsa-key-20200526"
  description = "Public ssh key"
}

variable "networkname" {
  default = "dropspublicnw"
  description = "Name of the public network"
}

variable "volname" {
  default = "myvol"
  description = "Name of the volume"
}

