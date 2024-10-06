provider "aws"{
    region = "ap-south-1"
}

resource "aws_s3_bucket" "example_bucket"{
    bucket = "my-unique-bucket-name"
    acl = "private"

    tags = {
        Name = "terra-githubac-bucket"
        environment = "Dev"

    }
}