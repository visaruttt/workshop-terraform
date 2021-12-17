terraform {
  required_version = "~> 1.0"
  required_providers {
    tfe = {
      source  = "hashicorp/tfe"
      version = " ~> 0.27"
    }
  }
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "workshop-guang1"

    workspaces {
      name = "test-workshop-workspace1"
    }
  }
}
