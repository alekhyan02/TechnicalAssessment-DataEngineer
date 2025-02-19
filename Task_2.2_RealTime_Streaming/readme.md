# 📌 Task 2.2: Real-time Data Streaming

This project sets up a **real-time data streaming pipeline** using **AWS Kinesis, Firehose, Glue, and Athena**. The goal is to **ingest, process, store, and analyze user touchpoints** in real-time.

---

## **📌 Overview**
This task involves:
✅ **Ingesting real-time user touchpoints** using **Amazon Kinesis Data Streams**.  
✅ **Delivering data** from Kinesis to **Amazon S3** via **Kinesis Firehose**.  
✅ **Processing and cataloging** streamed data using **AWS Glue**.  
✅ **Analyzing real-time data** in **Amazon Athena** using SQL queries.  

---

## **📁 Project Structure**
Task_2_AWS_Pipeline/ │── Task_2.2_RealTime_Streaming/ │ ├── terraform_scripts/ │ │ ├── main.tf # AWS provider configuration │ │ ├── variables.tf # Terraform variables │ │ ├── outputs.tf # Terraform outputs │ │ ├── kinesis.tf # Kinesis Data Stream setup │ │ ├── firehose.tf # Firehose Delivery Stream setup │ │ ├── glue.tf # AWS Glue Crawler setup │ │ ├── iam_roles.tf # IAM roles and permissions │ ├── lambda_function/ │ │ ├── lambda_function.py # Processes real-time streaming data │ │ ├── requirements.txt # Dependencies for Lambda function │ │ ├── event.json # Sample event for testing Lambda │ ├── athena_queries/ │ │ ├── conversion_rate.sql # Query to calculate conversion rates │ │ ├── revenue_per_user.sql # Query to compute rolling revenue │ ├── README.md # Documentation for the project

yaml
Copy
Edit

---

## **🛠️ Step-by-Step Deployment Guide**

### **1️⃣ Setting Up AWS Infrastructure Using Terraform**
#### **Navigate to the Terraform Scripts Directory:**
```sh
cd Task_2_AWS_Pipeline/Task_2.2_RealTime_Streaming/terraform_scripts/
Initialize Terraform
sh
Copy
Edit
terraform init
Validate the Configuration
sh
Copy
Edit
terraform validate
Plan Deployment
sh
Copy
Edit
terraform plan
Apply Deployment
sh
Copy
Edit
terraform apply -auto-approve
2️⃣ Testing Kinesis Stream
Send Test Data to Kinesis
sh
Copy
Edit
aws kinesis put-record \
  --stream-name user-touchpoints-stream \
  --partition-key user1 \
  --data "eyJ1c2VyX2lkIjogIjEyMzQ1IiwgInRvdWNocG9pbnRfZGF0ZSI6ICIyMDI1LTAyLTE5VDAwOjAwOjAwWiIsICJjaGFubmVsIjogIkZhY2Vib29rIiwgImNhbXBhaWduIjogIldpbnRlciBTYWxlIiwgInRvdWNocG9pbnRfdHlwZSI6ICJhZF9jbGljayIsICJzb3VyY2UiOiAibW9iaWxlIiwgIm1lZGl1bSI6ICJjcGMiLCAiY29udmVyc2lvbiI6IHRydWV9" \
  --region us-east-1
Check AWS Console → Kinesis Data Streams → Monitoring
Confirm that IncomingRecords metric is increasing ✅
3️⃣ Run AWS Glue Crawler
After setting up Firehose, run the AWS Glue Crawler:

sh
Copy
Edit
aws glue start-crawler --name marketing-data-crawler
4️⃣ Running Athena Queries
Login to AWS Console → Athena → Query Editor
Run SQL queries from athena_queries/:

Conversion Rate Calculation

sql
Copy
Edit
SELECT 
    channel, 
    COUNT(*) AS total_interactions,
    SUM(CASE WHEN conversion = TRUE THEN 1 ELSE 0 END) AS total_conversions,
    (SUM(CASE WHEN conversion = TRUE THEN 1 ELSE 0 END) * 100.0 / COUNT(*)) AS conversion_rate
FROM marketing_db.processed_data
GROUP BY channel
ORDER BY conversion_rate DESC;
Revenue Per User Calculation

sql
Copy
Edit
SELECT 
    user_id, 
    SUM(revenue) AS total_revenue,
    COUNT(*) AS total_transactions,
    AVG(revenue) AS avg_revenue_per_transaction
FROM marketing_db.processed_data
WHERE revenue IS NOT NULL
GROUP BY user_id
ORDER BY total_revenue DESC;
📌 Upload Instructions
Upload the following folders manually to GitHub under:

swift
Copy
Edit
Task_2_AWS_Pipeline/Task_2.2_RealTime_Streaming/
✅ terraform_scripts/ → All Terraform configuration files
✅ lambda_function/ → Lambda function and dependencies
✅ athena_queries/ → SQL queries for real-time analytics
✅ README.md → Documentation

🎯 Next Steps
Verify AWS Glue Tables → Check AWS Glue → Data Catalog → Tables
Test Athena Queries → Validate query results in Amazon Athena
Monitor Firehose Delivery → Ensure logs in CloudWatch
✅ Task 2.2 Successfully Completed! 🎉
Let me know if you need any modifications before uploading to GitHub. 🚀

yaml
Copy
Edit

---

This README file is **ready to be copied and pasted** into your GitHub repository. Let me know if you need any modifications. 🚀






