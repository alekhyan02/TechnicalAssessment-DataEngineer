resource "aws_glue_crawler" "glue_crawler" {
  name          = var.glue_crawler_name
  database_name = "marketing_db"
  role          = aws_iam_role.glue_role.arn

  s3_target {
    path = "s3://${aws_s3_bucket.firehose_bucket.bucket}/"
  }
}

