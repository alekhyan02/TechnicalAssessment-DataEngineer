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
