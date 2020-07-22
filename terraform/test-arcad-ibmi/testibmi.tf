data "ibm_pi_public_network" "dsnetwork" {
  depends_on           = [ibm_pi_network.power_networks]
  pi_cloud_instance_id = data.ibm_resource_instance.ds_power_instance.id
}

resource "ibm_pi_network" "power_networks" {
  count                = 1
  pi_cloud_instance_id = data.ibm_resource_instance.ds_power_instance.id
  pi_network_name      = var.networkname
  pi_network_type      = "pub-vlan"
}

resource "ibm_pi_volume" "volume"{
  pi_volume_size       = 10
  pi_volume_name       = var.volname
  pi_volume_type       = "tier3"
  pi_volume_shareable  = false
  pi_cloud_instance_id = data.ibm_resource_instance.ds_power_instance.id   
}

resource "ibm_pi_key" "key" {
  pi_cloud_instance_id = data.ibm_resource_instance.ds_power_instance.id
  pi_key_name          = var.sshkeyname
  pi_ssh_key           = var.sshkey
}

data "ibm_pi_image" "ds_image" {
  pi_cloud_instance_id = data.ibm_resource_instance.ds_power_instance.id
  pi_image_name        = var.imagename
}

#data "ibm_resource_group" "ds_resource_group" {
#  name = var.rsgroup
#}

data "ibm_resource_instance" "ds_power_instance" {
  name              = var.powerinstancename
  location          = var.instance_location
#  resource_group_id = data.ibm_resource_group.ds_resource_group.id
  service           = "power-iaas"
}

resource "ibm_pi_instance" "ibmi-instance" {
    pi_cloud_instance_id  = data.ibm_resource_instance.ds_power_instance.id 
    pi_image_id           = data.ibm_pi_image.ds_image.id // "ced28d6a-a0a3-4c80-bf9f-d1a3380a955e" // data.ibm_pi_image.ds_image.id
    pi_instance_name      = var.instancename
    pi_key_pair_name      = ibm_pi_key.key.key_id
    pi_memory             = "2" 
    pi_network_ids        = [data.ibm_pi_public_network.dsnetwork.id]
	pi_pin_policy		  = "none"
    pi_processors         = "0.25"
    pi_proc_type          = "shared" 
    pi_replicants         = "1" 
    pi_sys_type           = "s922" 
	pi_user_data		  = "" 
    pi_volume_ids         = [ibm_pi_volume.volume.volume_id]
}

output "ipadress" {
  value       = ibm_pi_instance.ibmi-instance.addresses[0].external_ip
  description = "The external IP address of the instance."
  sensitive   = false
}


