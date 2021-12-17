terraform {
  required_version = "~> 1.0"

  required_providers {
    checkly = {
      source  = "checkly/checkly"
      version = "~> 1.0"
    }
  }
}
