resource "aws_kinesis_stream" "user_touchpoints_stream" {
  name        = var.kinesis_stream_name

  stream_mode_details {
    stream_mode = "ON_DEMAND"
  }

  retention_period = 24
  encryption_type  = "NONE"
}

