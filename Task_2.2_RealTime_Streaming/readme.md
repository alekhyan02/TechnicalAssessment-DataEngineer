#  Task 2.2: Real-time Data Streaming

This project sets up a **real-time data streaming pipeline** using **AWS Kinesis, Firehose, Glue, and Athena**. The goal is to **ingest, process, store, and analyze user touchpoints** in real-time.


## ** Overview**
This task involves:
✅ **Ingesting real-time user touchpoints** using **Amazon Kinesis Data Streams**.  
✅ **Delivering data** from Kinesis to **Amazon S3** via **Kinesis Firehose**.  
✅ **Processing and cataloging** streamed data using **AWS Glue**.  
✅ **Analyzing real-time data** in **Amazon Athena** using SQL queries.  


## ** Step-by-Step Deployment Guide**

### **1️⃣ Setting Up AWS Infrastructure Using Terraform**
#### **Navigate to the Terraform Scripts Directory:**

cd Task_2_AWS_Pipeline/Task_2.2_RealTime_Streaming/terraform_scripts/

- Initialize Terraform:
  - terraform init
    
- Validate the Configuration:
  - terraform validate
    
- Plan Deployment:
  - terraform plan
    
- Apply Deployment:
  - terraform apply -auto-approve
    
### **2️⃣ Testing Kinesis Stream**
#### **Send Test Data to Kinesis:**

aws kinesis put-record \
  --stream-name user-touchpoints-stream \
  --partition-key user1 \
  --data "eyJ1c2VyX2lkIjogIjEyMzQ1IiwgInRvdWNocG9pbnRfZGF0ZSI6ICIyMDI1LTAyLTE5VDAwOjAwOjAwWiIsICJjaGFubmVsIjogIkZhY2Vib29rIiwgImNhbXBhaWduIjogIldpbnRlciBTYWxlIiwgInRvdWNocG9pbnRfdHlwZSI6ICJhZF9jbGljayIsICJzb3VyY2UiOiAibW9iaWxlIiwgIm1lZGl1bSI6ICJjcGMiLCAiY29udmVyc2lvbiI6IHRydWV9" \
  --region us-east-1
  
- Check AWS Console → Kinesis Data Streams → Monitoring
- Confirm that IncomingRecords metric is increasing ✅

  
### **3️⃣ Run AWS Glue Crawler**
After setting up Firehose, run the AWS Glue Crawler:

- aws glue start-crawler --name marketing-data-crawler

  
### **4️⃣ Running Athena Queries**

- Login to AWS Console → Athena → Query Editor
- Run SQL queries from athena_queries/:

- **Conversion Rate Calculation**

SELECT 
    channel, 
    COUNT(*) AS total_interactions,
    SUM(CASE WHEN conversion = TRUE THEN 1 ELSE 0 END) AS total_conversions,
    (SUM(CASE WHEN conversion = TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS conversion_rate
FROM marketing_db.processed_data
GROUP BY channel
ORDER BY conversion_rate DESC;

- **Revenue Per User Calculation**

SELECT 
    user_id, 
    SUM(revenue) AS total_revenue,
    COUNT(*) AS total_transactions,
    AVG(revenue) AS avg_revenue_per_transaction
FROM marketing_db.processed_data
WHERE revenue IS NOT NULL
GROUP BY user_id
ORDER BY total_revenue DESC;


Task_2_AWS_Pipeline/Task_2.2_RealTime_Streaming/
- terraform_scripts/ → All Terraform configuration files
- lambda_function/ → Lambda function and dependencies
- athena_queries/ → SQL queries for real-time analytics
- README.md → Documentation
