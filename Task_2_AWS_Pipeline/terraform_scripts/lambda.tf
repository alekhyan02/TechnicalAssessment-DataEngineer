resource "aws_lambda_function" "marketing_data_etl" {
  function_name = "marketing_data_etl"
  role          = "arn:aws:iam::977099003709:role/lambda_s3_glue_role"  # Update with correct IAM role
  handler       = "lambda_function.lambda_handler"
  runtime       = "python3.8"
  
  filename      = "lambda_function.zip"  # Ensure this file exists in your Terraform directory
  source_code_hash = filebase64sha256("lambda_function.zip")

  timeout       = 30
  memory_size   = 128
}

