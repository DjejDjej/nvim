Vim�UnDo� ޹��j�#u0�1)
�3N��g�G8V$�[[   M                                  g��    _�                             ����                                                                                                                                                                                                                                                                                                                                                             g�#     �              I   variable "network_name" {     type = string   }       variable "nodes" {     type = list(map(string))   }       # Create each VM in a loop    resource "libvirt_domain" "vm" {     count = length(var.nodes)       &  name   = var.nodes[count.index].name     memory = 2048     vcpu   = 2         network_interface {   #    network_name = var.network_name   .    addresses    = [var.nodes[count.index].ip]     }       0  # Create a copy of the base volume for each VM     disk {   -    volume_id = libvirt_volume.base_volume.id     }       4  # Cloud-init for hostname and static IP assignment     cloudinit {       user_data = <<EOF   #cloud-config   (hostname: ${var.nodes[count.index].name}   manage_etc_hosts: true   network:     version: 2     ethernets:   	    eth0:         dhcp4: no   2      addresses: [${var.nodes[count.index].ip}/24]         gateway4: 192.168.200.1         nameservers:   %        addresses: [8.8.8.8, 8.8.4.4]         routes:           - to: 0.0.0.0/0             via: 192.168.200.1             on-link: true       write_files:     - path: /etc/hosts       content: |         127.0.0.1 localhost   A      ${var.nodes[count.index].ip} ${var.nodes[count.index].name}         192.168.200.50 master1         192.168.200.51 master2         192.168.200.52 worker1         192.168.200.53 worker2   EOF     }         console {       type        = "pty"       target_port = "0"       target_type = "serial"     }         graphics {       type = "spice"     }         provisioner "local-exec" {   c    command = "echo VM ${var.nodes[count.index].name} with IP ${var.nodes[count.index].ip} created"     }   }    5��            I                      �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             g�%    �                   �               5��                    @                       �      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             g��     �              A   # Loop to create VMs    resource "libvirt_domain" "vm" {     count = length(var.nodes)       &  name   = var.nodes[count.index].name     memory = 2048     vcpu   = 2         network_interface {   2    network_name = libvirt_network.vm_network.name   .    addresses    = [var.nodes[count.index].ip]     }       S  # Create a copy of the base volume for each VM (adjust the volume path as needed)     disk {   -    volume_id = libvirt_volume.base_volume.id     }       8  # Cloud-init configuration to set hostname and network     cloudinit {       user_data = <<EOF   #cloud-config   (hostname: ${var.nodes[count.index].name}   manage_etc_hosts: true   network:     version: 2     ethernets:   	    eth0:         dhcp4: no   2      addresses: [${var.nodes[count.index].ip}/24]         gateway4: 192.168.200.1         nameservers:   %        addresses: [8.8.8.8, 8.8.4.4]         routes:           - to: 0.0.0.0/0             via: 192.168.200.1             on-link: true       write_files:     - path: /etc/hosts       content: |         127.0.0.1 localhost   A      ${var.nodes[count.index].ip} ${var.nodes[count.index].name}         192.168.200.50 master1         192.168.200.51 master2         192.168.200.52 worker1         192.168.200.53 worker2   EOF     }         console {       type        = "pty"       target_port = "0"       target_type = "serial"     }         graphics {       type = "spice"     }         provisioner "local-exec" {   c    command = "echo VM ${var.nodes[count.index].name} with IP ${var.nodes[count.index].ip} created"     }   }    5��            A                      �             5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             g��    �                   �               5��                    .                       v      5�_�                            ����                                                                                                                                                                                                                                                                                                                                                             g��     �              /   8# Define the base volume that will be cloned for each VM   )resource "libvirt_volume" "base_volume" {     name   = "base-volume"     pool   = "default"   ]  source = "/var/lib/libvirt/images/base.qcow2"  # Adjust this to the path of your base image     format = "qcow2"   }       "# Loop to create VMs for each node    resource "libvirt_domain" "vm" {     count = length(var.nodes)       &  name   = var.nodes[count.index].name     memory = 2048     vcpu   = 2       $  # Network interface with static IP     network_interface {   2    network_name = libvirt_network.vm_network.name   .    addresses    = [var.nodes[count.index].ip]     }       *  # Disk using a cloned volume for each VM     disk {   -    volume_id = libvirt_volume.base_volume.id     }       8  # Cloud-init configuration for hostname, network, etc.     cloudinit {       user_data = <<EOF   #cloud-config   (hostname: ${var.nodes[count.index].name}   manage_etc_hosts: true   network:     version: 2     ethernets:   	    eth0:         dhcp4: no   2      addresses: [${var.nodes[count.index].ip}/24]         gateway4: 192.168.200.1         nameservers:   %        addresses: [8.8.8.8, 8.8.4.4]         routes:           - to: 0.0.0.0/0             via: 192.168.200.1             on    5��            /                      w             5�_�                             ����                                                                                                                                                                                                                                                                                                                                                             g��    �                   �               5��                    L                             5��