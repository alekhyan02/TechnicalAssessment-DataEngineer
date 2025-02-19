variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "s3_bucket_name" {
  description = "S3 Bucket name"
  type        = string
  default     = "my-marketing-data-bucket-12345"
}

variable "glue_database_name" {
  description = "Glue Database name"
  type        = string
  default     = "marketing_db"
}

variable "lambda_function_name" {
  description = "Lambda function name"
  type        = string
  default     = "marketing_data_etl"
}

