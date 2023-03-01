variable "vm_name" {
	type = string
}

variable "vm_desc" {
	type = string
}

variable "vmid" {
	type = string
}

variable "target_node" {
	type = string
}

variable "clone" {
	type = string
}

variable "ipconfig0" {
	type = string
}

variable "sshkeys" {
	type = string
	sensitive = true
}

variable "ciuser" {
	type = string
}

resource "proxmox_vm_qemu" "create_vm" {
	name = var.vm_name
	desc = var.vm_desc
	vmid = var.vmid
	target_node = var.target_node

	clone = var.clone
	full_clone = true

	cores = 2
	sockets = 1
	memory = 2048

	scsihw = "virtio-scsi-pci"
	bootdisk = "scsi0"

	disk {
		size = "40G"
		type = "scsi"
		storage = "local-lvm"
	}

	network {
		model = "virtio"
		bridge = "vmbr0"
	}


	# Cloud Init settings
	ipconfig0 = var.ipconfig0
	ciuser = var.ciuser
	sshkeys = var.sshkeys
}
