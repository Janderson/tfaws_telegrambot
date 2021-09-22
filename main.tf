terraform {
  required_version = ">= 0.12"
}

provider "aws" {
    #alias = "main"
    region = var.aws_region
}

provider "archive" {

}