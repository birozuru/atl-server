output "atlantis_ip" {
  value = module.atlantis.atlantis_public_ip
}

output "atlantis_ssh_user" {
  value = module.atlantis.atlantis_ssh_user
}

output "atlantis_xip_domain" {
  value = module.atlantis.atlantis_xip_domain
}
