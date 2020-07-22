## Template to be used by the IBM Provider for Power Systems


#data "ibm_pi_network" "power_networks" {
#  count                = length(var.networks)
#  pi_network_name      = var.networks[count.index]
#  pi_cloud_instance_id = var.power_instance_id
#}

data "ibm_pi_image" "power_images" {
  pi_image_name        = var.image_name
  pi_cloud_instance_id = var.power_instance_id
}

resource "ibm_pi_network" "power_network_public" {
  count                = 1
  pi_network_name      = var.pub-vlan_name 
  pi_cloud_instance_id = var.power_instance_id 
  pi_network_type      = "pub-vlan"
}

# Display DROPS-IBMI image info
output "img-ibmi-size" {
  value = data.ibm_pi_image.power_images.size
}


