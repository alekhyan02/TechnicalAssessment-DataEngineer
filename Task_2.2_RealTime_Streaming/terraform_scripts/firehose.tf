resource "aws_s3_bucket" "firehose_bucket" {
  bucket = var.s3_bucket_name
}

resource "aws_kinesis_firehose_delivery_stream" "firehose_stream" {
  name        = var.firehose_stream_name
  destination = "extended_s3"

  kinesis_source_configuration {
    kinesis_stream_arn = aws_kinesis_stream.user_touchpoints_stream.arn
    role_arn           = aws_iam_role.firehose_role.arn
  }

  extended_s3_configuration {
    role_arn           = aws_iam_role.firehose_role.arn
    bucket_arn         = aws_s3_bucket.firehose_bucket.arn
    buffering_size     = 5
    buffering_interval = 60
    compression_format = "GZIP"

    cloudwatch_logging_options {
      enabled         = true
      log_group_name  = "/aws/kinesisfirehose/user-touchpoints-firehose"
      log_stream_name = "S3Delivery"
    }
  }
}

