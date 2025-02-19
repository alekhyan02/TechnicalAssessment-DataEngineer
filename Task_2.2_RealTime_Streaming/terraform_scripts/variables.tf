variable "aws_region" {
  description = "AWS region"
  default     = "us-east-1"
}

variable "kinesis_stream_name" {
  description = "Name of the Kinesis data stream"
  default     = "user-touchpoints-stream"
}

variable "firehose_stream_name" {
  description = "Name of the Kinesis Firehose delivery stream"
  default     = "user-touchpoints-firehose"
}

variable "s3_bucket_name" {
  description = "S3 bucket for Firehose delivery"
  default     = "my-unique-firehose-bucket-2025"
}

variable "glue_crawler_name" {
  description = "Name of the Glue Crawler"
  default     = "marketing-data-crawler"
}

