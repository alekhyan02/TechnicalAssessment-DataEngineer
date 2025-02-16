# Technical Assessment — Data Engineer

***Duration**: 2-4 hours*

## Introduction

This technical assessment evaluates your expertise in marketing analytics, focusing on attribution modeling, performance analysis, and strategic recommendations for a mobile app that offers bitcoin rewards to users.

---

## Available Data

1. marketing_spend.csv
    
    [marketing_spend.csv](https://prod-files-secure.s3.us-west-2.amazonaws.com/a0fc7e7c-6610-4ccf-8e73-7d5d98a3f0d8/66599bf5-bc38-4144-a2a0-490669a5fbac/marketing_spend.csv)
    
    - date: Date of marketing activity
    - channel: Marketing channel
    - campaign: Campaign name
    - spend: Daily spend amount
    - impressions: Number of impressions
    - clicks: Number of clicks
    - installs: Number of app installs
2. users.csv
    
    [users.csv](https://prod-files-secure.s3.us-west-2.amazonaws.com/a0fc7e7c-6610-4ccf-8e73-7d5d98a3f0d8/06e53388-2adf-4db1-a58d-095922c75e32/users.csv)
    
    - user_id: Unique user identifier
    - installed_at: Timestamp of app installation
    - created_at: Account creation timestamp
    - updated_at: Last account update timestamp
    - channel: Acquisition channel
    - campaign: Acquisition campaign
3. user_touchpoints.csv
    
    [user_touchpoints.csv](https://prod-files-secure.s3.us-west-2.amazonaws.com/a0fc7e7c-6610-4ccf-8e73-7d5d98a3f0d8/1ab31e9d-3f36-4076-b518-6bb13b95b88c/user_touchpoints.csv)
    
    - user_id: User identifier
    - touchpoint_date: Timestamp of interaction
    - channel: Marketing channel
    - campaign: Campaign name
    - touchpoint_type: Type of interaction (ad_impression, ad_click, etc.)
    - source: Traffic source
    - medium: Traffic medium
    - conversion: Boolean flag for conversion events
4. revenue_and_rewards.csv
    
    [revenue_and_rewards.csv](https://prod-files-secure.s3.us-west-2.amazonaws.com/a0fc7e7c-6610-4ccf-8e73-7d5d98a3f0d8/0e62f09b-ad4a-44ce-adec-217d795da741/revenue_and_rewards.csv)
    
    - user_id: User identifier
    - date: Transaction date
    - revenue: Revenue amount
    - reward_to_user: Bitcoin rewards given to user

---

## 1 — Data Warehousing

You can utilize a SQL relational database such as SQLite3, Postgres, and insert the records. Alternatively, you could use [Supabase.com](http://Supabase.com) to create a DB, table schemas, and upload the CSVs to the tables. Whatever approach you’d like to take is fine. 

### Task 1.1: Data Modeling

*Document your ERD using tools like [dbdiagram.io](http://dbdiagram.io/), Lucidchart, or a hand-drawn diagram with clear relationships.*

1. Design a relational data model for the following tables:
    - `marketing_spend`
    - `users`
    - `user_touchpoints`
    - `revenue_and_rewards`
2. Justify the relationships and any assumptions you make.

### Task 1.2: Data Ingestion

1. Populate the tables with sample data. You can generate data programmatically or insert it manually.
2. Ensure all data maintains referential integrity across the tables.

### Task 1.3: Analytics Layer

1. Write SQL queries to summarize:
    - Channel-level performance (e.g., total spend, impressions, clicks, conversions, revenue).
    - Campaign-level performance (e.g., conversions, revenue, ROAS).
2. Create a denormalized table for the `users` dataset that includes key metrics (e.g., total revenue, total rewards, number of touchpoints) as a materialized view or airflow table.

### Task 1.4: Workflow Automation

1. Use Apache Airflow to:
    - Extract and summarize channel and campaign performance.
    - Export the results to a Google Sheet.
2. Share the Google Sheet and repositories with [santos@zbd.gg](mailto:santos@zbd.gg).

---

## **2 — Bonus: AWS Data Infrastructure Deployment**

<aside>
👉

*This section is optional but helps candidates stand out if completed.*

</aside>

- You may use **any dataset of your choosing**, as this section is designed to assess **DevOps and AWS infrastructure expertise** rather than data analytics skills.
    - *Ensure your AWS setup is cost-efficient. If using Glue, limit dataset size to stay within the free tier.*

### **Bonus Task 2.1: AWS Data Pipeline Setup**

1. **Infrastructure as Code (IaC)**
    - Use **Terraform** to provision the following AWS services:
        - **S3**: Store raw marketing data files.
        - **Glue**: Set up a Glue **Crawler** and **Data Catalog** to structure the data.
        - **Athena**: Query data stored in S3.
        - **Lambda (optional)**: Automate ETL or transformations.
    - Submit your Terraform scripts.
2. **Data Ingestion Pipeline**
    - Write a **Python script** (or use AWS Lambda) to:
        - Ingest the CSV datasets into S3.
        - Trigger a Glue job or Lambda function to transform the data and write it back to S3.
    - Provide the script and a brief explanation of its flow.
3. **SQL Queries Using Athena**
    - Write **Athena SQL queries** to:
        - Summarize **channel and campaign performance**.
        - Calculate **user lifetime value (LTV)** based on revenue and rewards.

### **Bonus Task 2.2: Real-time Data Streaming**

1. **Kinesis Data Stream Setup**
    - Use **Terraform** to set up:
        - **Amazon Kinesis Data Streams** for ingesting user touchpoints in real-time.
        - **Amazon Kinesis Firehose** to stream data into an S3 bucket.
2. **Streaming Analytics (Optional for Extra Credit)**
    - Use **Kinesis Data Analytics** to:
        - Aggregate real-time conversion rates by marketing channel.
        - Compute rolling revenue metrics per user.

---

## Submission Guidelines

1. Provide all SQL queries and code, preferably on GitHub. 
2. Record a video presenting your work.
3. Email [santos@zbd.gg](mailto:santos@zbd.gg) with submission materials and [schedule a call](https://zbd.one/meet-santos) with at least a day’s notice giving time to review the materials.

---
