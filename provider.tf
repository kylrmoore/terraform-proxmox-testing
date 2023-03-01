terraform {
	required_providers {
		proxmox = {
			source = "telmate/proxmox"
			version = "2.9.6"
		}
	}
}

variable "proxmox_api_url" {
	type = string
}

variable "proxmox_username" {
	type = string
	sensitive = true
}

variable "proxmox_password" {
	type = string
	sensitive = true
}

provider "proxmox" {
	pm_api_url = var.proxmox_api_url
	pm_user = var.proxmox_username
	pm_password = var.proxmox_password
	pm_tls_insecure = true
}
