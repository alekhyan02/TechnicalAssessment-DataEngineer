import json
import boto3
import base64
import os

s3 = boto3.client("s3")

# Get environment variables
S3_BUCKET = os.environ.get("S3_BUCKET", "your-firehose-destination-bucket")

def lambda_handler(event, context):
    records = []

    for record in event["Records"]:
        # Decode Base64 data from Kinesis
        payload = base64.b64decode(record["kinesis"]["data"]).decode("utf-8")
        
        try:
            data = json.loads(payload)
            records.append(data)
        except json.JSONDecodeError as e:
            print(f"Error decoding JSON: {str(e)}")
            continue

    if records:
        # Convert to JSON format and upload to S3
        file_name = f"processed_data/{context.aws_request_id}.json"
        s3.put_object(
            Bucket=S3_BUCKET,
            Key=file_name,
            Body=json.dumps(records, indent=4),
            ContentType="application/json"
        )

        print(f"Uploaded {file_name} to {S3_BUCKET}")

    return {
        "statusCode": 200,
        "body": json.dumps({"message": "Processed records successfully"})
    }

