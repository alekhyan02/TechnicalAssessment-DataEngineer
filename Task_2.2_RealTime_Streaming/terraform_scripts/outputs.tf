output "kinesis_stream_arn" {
  value = aws_kinesis_stream.user_touchpoints_stream.arn
}

output "firehose_stream_arn" {
  value = aws_kinesis_firehose_delivery_stream.firehose_stream.arn
}

output "s3_bucket_arn" {
  value = aws_s3_bucket.firehose_bucket.arn
}

output "glue_crawler_name" {
  value = aws_glue_crawler.glue_crawler.name
}


