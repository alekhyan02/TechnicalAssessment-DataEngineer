# 🏗️ Task 1: Data Warehousing

This task focuses on designing, ingesting, analyzing, and automating a **data warehousing pipeline** for marketing analytics.

---

## 📌 **Overview**
- **Data Modeling** → Designing an ERD diagram to understand data relationships.
- **Data Ingestion** → Using Python & Pandas to ingest raw data.
- **Analytics Layer** → Performing business analytics using Pandas & SQL.
- **Workflow Automation** → Automating the ETL process with Python.

---

## 📁 **File Descriptions**

### **1️⃣ Data Modeling (ERD)**
- **File:** `Task_1.1_DataModeling_ERD.pdf`
- **Purpose:** Defines relationships between datasets using an **Entity Relationship Diagram (ERD)**.
- **Includes:** User data, marketing interactions, campaign budgets, and revenue details.

---

### **2️⃣ Data Ingestion**
- **File:** `Task_1.2_DataIngestion.ipynb`
- **Purpose:** Loads raw CSV files into Pandas, merges datasets, and stores processed data.
- **Steps:**
  - Read CSV files (`users.csv`, `user_touchpoints.csv`, `marketing_spend.csv`, `revenue_and_rewards.csv`).
  - Merge datasets based on common keys (`user_id`, `campaign_id`).
  - Save the cleaned dataset for further processing.

---

### **3️⃣ Analytics Layer**
- **File:** `Task_1.3_AnalyticsLayer.ipynb`
- **Purpose:** Extracts business insights from the processed data using Pandas & SQL.
- **Analysis Performed:**
  - **User engagement per marketing channel**
  - **Conversion rates per campaign**
  - **Revenue per user**

---

### **4️⃣ Workflow Automation**
- **File:** `Task_1.4_WorkflowAutomation.py`
- **Purpose:** Automates the data pipeline execution using Python.
- **Automation Includes:**
  - Running `Task_1.2_DataIngestion.ipynb` and `Task_1.3_AnalyticsLayer.ipynb`.
  - Scheduling the pipeline to run **daily at 1:00 AM** using Python’s `schedule` library.

---

## 🚀 **How to Run**
1. Ensure you have **Python 3.x** and the required libraries installed (`pandas`, `schedule`).
2. Run the ingestion step manually:
   ```sh
   python Task_1.2_DataIngestion.ipynb
3.Run the analytics layer:
  ```sh
  python Task_1.3_AnalyticsLayer.ipynb
4.Automate the workflow:
  ```sh
  python Task_1.4_WorkflowAutomation.py
(This script will keep running in the background and execute tasks on schedule.)
