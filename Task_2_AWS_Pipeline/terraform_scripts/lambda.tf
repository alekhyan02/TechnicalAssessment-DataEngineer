resource "aws_lambda_function" "marketing_data_etl" {
  filename         = "lambda_function.zip"
  function_name    = "marketing_data_etl"
  role            = aws_iam_role.lambda_role.arn
  handler         = "lambda_function.lambda_handler"
  runtime         = "python3.8"
  timeout         = 30
  memory_size     = 128
  depends_on      = [aws_iam_role.lambda_role]
}

resource "aws_lambda_permission" "allow_s3_trigger" {
  statement_id  = "AllowExecutionFromS3"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.marketing_data_etl.function_name
  principal     = "s3.amazonaws.com"
  source_arn    = aws_s3_bucket.marketing_data.arn
}

resource "aws_s3_bucket_notification" "s3_trigger" {
  bucket = aws_s3_bucket.marketing_data.id

  lambda_function {
    lambda_function_arn = aws_lambda_function.marketing_data_etl.arn
    events             = ["s3:ObjectCreated:*"]
  }
}

