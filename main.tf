provider "aws" {
    region = "ca-central-1"
}

resource "aws_s3_bucket" "my_bucket" {
    bucket = "unique-bucket-lavanya-08"

    tags = {
    Project       = "Create an s3 bucket with terraform"
  }
}

resource "aws_s3_bucket_public_access_block" "my_bucket_public_access_block" {
    bucket = aws_s3_bucket.my_bucket.id

    block_public_acls = true
    ignore_public_acls = true
    block_public_policy = true
    restrict_public_buckets = true 
}

resource "aws_s3_object" "image" {
    bucket = aws_s3_bucket.my_bucket.id #reference the bucket id
    key = "image.jpg"
    source = "image.jpg"
}