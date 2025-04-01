terraform {
  backend "s3" {
    bucket         = "terraform-aws-main-bucket"
    key            = "terraform.tfstate"
    region         = "ap-south-1"  
    encrypt        = true
  }
}