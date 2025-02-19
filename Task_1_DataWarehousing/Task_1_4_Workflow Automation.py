from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.providers.postgres.hooks.postgres import PostgresHook
from airflow.utils.dates import days_ago
import gspread
from oauth2client.service_account import ServiceAccountCredentials

def extract_channel_campaign_performance():
    # pg_hook = PostgresHook(postgres_conn_id='postgresql://postgres.ylhsfopeerhruicwrdsl:Alekhya%4028@aws-0-us-east-1.pooler.supabase.com:5432/postgres')
    
    pg_hook = PostgresHook(postgres_conn_id="supabase_postgres")


    sql = """
      WITH spend_summary AS (
          SELECT channel, campaign, SUM(spend) AS total_spend
          FROM marketing_spend
          GROUP BY channel, campaign
      ),
      revenue_summary AS (
          SELECT u.channel, u.campaign, SUM(r.revenue) AS total_revenue
          FROM users u
          JOIN revenue_and_rewards r ON u.user_id = r.user_id
          GROUP BY u.channel, u.campaign
      )
      SELECT s.channel, s.campaign, s.total_spend, COALESCE(r.total_revenue, 0) AS total_revenue
      FROM spend_summary s
      LEFT JOIN revenue_summary r
        ON s.channel = r.channel AND s.campaign = r.campaign;
    """
    conn = pg_hook.get_conn()
    records = pg_hook.get_records(sql)
    return records

def export_to_google_sheet(**context):
    # Retrieve the performance data from the previous task
    data = context['ti'].xcom_pull(task_ids='extract_performance')
    
    # Set up credentials to access Google Sheets
    scope = ['https://spreadsheets.google.com/feeds', 'https://www.googleapis.com/auth/drive']
    creds = ServiceAccountCredentials.from_json_keyfile_name('/opt/airflow/dags/credentials.json', scope)
    client = gspread.authorize(creds)
    print("client")
    
    # Open the Google Sheet by name (or by key)
    sheet = client.open("Marketing Performance").sheet1
    
    # # Clear existing data and set header row
    sheet.clear()
    header = ['Channel', 'Campaign', 'Total Spend', 'Total Revenue']
    sheet.append_row(header)
    
    # # Append performance data rows
    for row in data:
        sheet.append_row(row)

default_args = {
    'owner': 'data_eng',
    'start_date': days_ago(1)
}

with DAG(
    dag_id='supabase_marketing_performance',
    default_args=default_args,
    schedule_interval='@daily',
    catchup=False
) as dag:
    
    extract_task = PythonOperator(
        task_id='extract_performance',
        python_callable=extract_channel_campaign_performance
    )
    
    export_task = PythonOperator(
        task_id='export_to_sheet',
        python_callable=export_to_google_sheet,
        provide_context=True
    )
    
    extract_task >> export_task
