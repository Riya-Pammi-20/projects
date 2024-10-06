provider "aws" {
    region = "ap-south-1"
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "rilo-unique-1220"

      tags = {
        Name = "terra-githubac-bucket"
        environment = "Dev"

    }
}

