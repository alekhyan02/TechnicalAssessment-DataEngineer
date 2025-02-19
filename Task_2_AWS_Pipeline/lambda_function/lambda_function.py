import json
import boto3
import pandas as pd
from io import StringIO

# AWS Clients
s3 = boto3.client('s3')
glue = boto3.client('glue')

# Define S3 Bucket and Glue Crawler
S3_BUCKET = "my-marketing-data-bucket-12345"
GLUE_CRAWLER = "marketing-data-crawler"

def lambda_handler(event, context):
    # Extract file info from S3 event
    record = event['Records'][0]
    bucket_name = record['s3']['bucket']['name']
    file_key = record['s3']['object']['key']

    print(f"Processing file: s3://{bucket_name}/{file_key}")

    # Read CSV file from S3
    response = s3.get_object(Bucket=bucket_name, Key=file_key)
    df = pd.read_csv(response['Body'])

    # Data Cleaning & Transformation
    df.dropna(inplace=True)  # Remove null values
    df['job'] = df['job'].str.capitalize()  # Standardize job names

    # Convert back to CSV format
    csv_buffer = StringIO()
    df.to_csv(csv_buffer, index=False)

    # Define the transformed file path
    transformed_key = f"processed-data/{file_key.split('/')[-1]}"
    
    # Upload transformed data back to S3
    s3.put_object(Bucket=bucket_name, Key=transformed_key, Body=csv_buffer.getvalue())

    print(f"Transformed data uploaded to: s3://{bucket_name}/{transformed_key}")

    # Start AWS Glue Crawler to update Athena tables
    glue.start_crawler(Name=GLUE_CRAWLER)
    print("Glue Crawler started successfully!")

    return {
        'statusCode': 200,
        'body': json.dumps('ETL process completed successfully!')
    }

