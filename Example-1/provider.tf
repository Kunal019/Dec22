provider "aws" {
  profile = "default"   #phc
  region  = "${var.default_region}"

}

terraform {
  required_version = ">= 0.12"
}