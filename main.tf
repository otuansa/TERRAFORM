provider "aws" {
  region = "eu-west-2"
}

resource "aws_s3_bucket" "example_bucket" {
  bucket = "learning-buckets2025"
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example_bucket.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "example_bucket_encryption" {
  bucket = aws_s3_bucket.example_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}
output "bucket_name" {
  value = aws_s3_bucket.example_bucket.bucket
  description = "terraform_demo_bucket"  
}