resource "tls_private_key" "ssh"{
    algorithm = "RSA"
    rsa_bits = 4096
}

resource "azurerm_key_vault_secret" "aks_ssh_public_key" {
  name="aks-ssh-public-key"
  value = tls_private_key.ssh.public_key_openssh
  key_vault_id =  data.terraform_remote_state.analyticsstate.outputs.keyvault_id
  tags = merge(
    var.tags, {
      Proposito = "SSH"
      Formato   = "Openssh"
    }
  )

}

resource "azurerm_key_vault_secret" "aks_ssh_priv_key" {
  name         = "aks-ssh-priv-key"
  value        = tls_private_key.ssh.private_key_pem
  key_vault_id = data.terraform_remote_state.analyticsstate.outputs.keyvault_id
  tags = merge(
    var.tags, {
      Proposito = "SSH"
      Formato   = "PEM"
    }
  )  
}
