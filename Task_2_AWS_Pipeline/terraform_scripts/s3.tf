resource "aws_s3_bucket" "marketing_data" {
  bucket = "my-marketing-data-bucket-12345"  # Change to a unique bucket name
}

resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.marketing_data.id
  versioning_configuration {
    status = "Enabled"
  }
}
