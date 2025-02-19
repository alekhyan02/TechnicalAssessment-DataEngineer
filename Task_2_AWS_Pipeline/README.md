# AWS Data Pipeline (Task 2.1)

## Overview
This project provisions an AWS data pipeline using Terraform and includes:
- S3 for raw data storage
- Glue for data cataloging
- Athena for querying data
- Lambda for ETL automation

## Infrastructure
- **Terraform Scripts**: Define AWS resources.
- **Lambda Function**: Processes & transforms data.
- **Athena Queries**: Used for data analysis.

## Instructions
1. Deploy the infrastructure using Terraform.
2. Upload data to S3.
3. Run the Glue Crawler.
4. Use Athena to analyze the data.

## Queries Included
- `channel_performance.sql`
- `campaign_performance.sql`
- `user_ltv.sql`

# AWS Data Pipeline Setup (Task 2.1)

This folder contains the AWS Data Pipeline setup using **Terraform**, **AWS Glue**, **Athena**, and **AWS Lambda** for marketing analytics.

## 📂 Directory Structure

- **terraform_scripts/** → Terraform scripts to deploy AWS services:
  - S3: Stores raw marketing data.
  - Glue: Crawlers to structure the data.
  - Athena: Queries to analyze marketing performance.
  - Lambda: ETL process automation.

- **lambda_function/** → Python script for ETL process triggered by AWS Lambda:
  - `lambda_function.py`: Reads data from S3 and transforms it.
  - `event.json`: Sample event input for Lambda testing.

- **athena_queries/** → SQL queries for marketing analytics:
  - `channel_performance.sql`: Analyze marketing channel performance.
  - `campaign_performance.sql`: Evaluate campaign-level performance.
  - `user_ltv.sql`: Calculate user lifetime value (LTV).

---

## 🚀 Deployment Steps

AWS_Lambda_Deployment:
  Step_1: Zip the Lambda Function
  Commands:
    - cd lambda_function/
    - zip -r lambda_function.zip lambda_function.py

  Step_2: Deploy the Lambda Function
  Commands:
    - aws lambda update-function-code \
        --function-name marketing_data_etl \
        --zip-file fileb://lambda_function.zip

AWS_Glue_Crawler:
  Step_3: Run the Glue Crawler
  Commands:
    - aws glue start-crawler --name marketing-data-crawler

AWS_Athena_Queries:
  Step_4: Run Athena Queries
  Instructions:
    - Open AWS Console → Athena.
    - Run the following queries from the `athena_queries/` folder:
      - channel_performance.sql
      - campaign_performance.sql
      - user_ltv.sql
  Analyze_Results: Check the outputs in Athena Query Results.

