resource "aws_athena_workgroup" "marketing_workgroup" {
  name = "marketing-analysis-workgroup"

  configuration {
    enforce_workgroup_configuration = true
    result_configuration {
      output_location = "s3://${aws_s3_bucket.marketing_data.bucket}/athena-results/"
    }
  }
}
