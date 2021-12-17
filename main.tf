
provider "tfe" {
  # Configuration options
  # Grab a user token (https://www.terraform.io/cloud-docs/users-teams-organizations/api-tokens)
  token = var.tfc_user_token
}

resource "tfe_organization" "workshop_guang" {
  name  = "workshop-guang1"
  email = "visarut@honestbank.com"
}

resource "tfe_workspace" "test_workshop_workspace1" {
  name         = "test-workshop-workspace1"
  organization = tfe_organization.workshop_guang.name
  tag_names    = ["tag1", "tag2"]
}

resource "tfe_variable" "checkly_api_key" {
  category     = "terraform"
  key          = "checkly_api_key"
  workspace_id = tfe_workspace.test_workshop_workspace1.id
  sensitive    = true
}

resource "tfe_variable" "checkly_account_id" {
  category     = "terraform"
  key          = "checkly_account_id"
  workspace_id = tfe_workspace.test_workshop_workspace1.id
  sensitive    = false
}

module "workshop_checkly" {
  source = "./modules/checkly"
  checkly_account_id = var.checkly_account_id
  checkly_api_key = var.checkly_api_key
}
