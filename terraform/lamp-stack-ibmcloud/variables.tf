################################################################
# Module to deploy an VM with specified applications installed
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Licensed Materials - Property of IBM
#
# ©Copyright IBM Corp. 2020
#
################################################################
variable "basename" {
  description = "Denotes the name of the VPC to deploy into. Resources associated will be prepended with this name."
  default = "lamp"
}

variable "boot_image_id" {
  description = "UUID of the base image for the virtual server (should be an Ubuntu 18.04 base)"
  default = "r006-d2f5be47-f7fb-4e6e-b4ab-87734fd8d12b"
}

variable "vpc_region" {
  description = "Target region to create this instance"
  default = "us-south"
}

variable "vpc_zone" {
  description = "Target availbility zone to create this instance"
  default = "us-south-3"
}

variable "storage_profile" {
  description = "Set the storage profile"
  default = "10iops-tier"
}

variable "storage_capacity" {
  description = "Storage capacity size to create"
  default = "200"
}

variable "storage_zone" {
  description = "Specify which storage zone to use"
  default = "us-south-3"
}

variable "vm_profile" {
  description = "What resources or VM profile should we create for compute? "
  default = "cp2-2x4"
}

variable "db_password" {
  description = "Setup DB password for MariaDB"
  default = "maria-apache-password-for-lampstack2"
}
