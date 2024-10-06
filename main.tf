provider "aws"{
    region = "ap-south-1"
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "my-example-bucket"

      tags = {
        Name = "terra-githubac-bucket"
        environment = "Dev"

    }
}

resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.example_bucket.id
  acl    = "private"
}
