terraform {
  backend "s3" {
    key    = "terraform.tfstate"
    region = "ap-southeast-1"
  }
}
