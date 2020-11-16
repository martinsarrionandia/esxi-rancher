provider "aws" {
  version = "~> 3.0"
  region  = "eu-west-1"
}

# Provider bootstrap config with alias
provider "rancher2" {
  alias = "bootstrap"

  api_url   = "https://rancher.server"
  bootstrap = true
  insecure  = true
}

# Provider rancher2 post bootstrap
provider "rancher2" {

  api_url   = "https://rancher.server"
  token_key = rancher2_bootstrap.admin.token
	insecure  = true
}
