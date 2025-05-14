terraform {
  required_providers {
    konnect = {
      source  = "kong/konnect"
    }
  }
  backend "s3" {
    bucket         = "tf-state-kong-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}

provider "konnect" {
  personal_access_token = var.personal_access_token
  server_url            = "https://us.api.konghq.com"
}
