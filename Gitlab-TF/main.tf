terraform {
  backend "s3" {
    bucket = "my-tf-secret123"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}







