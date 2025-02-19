resource "aws_glue_crawler" "marketing_crawler" {
  name          = "marketing-data-crawler"
  database_name = "marketing_db"  # Use the existing database name directly
  role          = "arn:aws:iam::977099003709:role/AWSGlueServiceRole"  # Your Glue IAM Role

  s3_target {
    path = "s3://${aws_s3_bucket.marketing_data.bucket}/"
  }
}


