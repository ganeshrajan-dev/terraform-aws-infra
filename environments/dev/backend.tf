terraform {
  backend "s3" {
    bucket = "terra-satatee"
    key = "dev/terraform.tfstate"
    region = "us-east-1"
    use_lockfile = true
    encrypt = true
    
  }
}