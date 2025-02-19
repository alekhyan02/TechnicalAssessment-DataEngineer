output "s3_bucket_name" {
  value = aws_s3_bucket.marketing_data.bucket
}

output "athena_workgroup_name" {
  value = aws_athena_workgroup.marketing_workgroup.name
}
