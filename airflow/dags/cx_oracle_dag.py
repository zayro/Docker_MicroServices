from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime
import cx_Oracle

def execute_query():
    dsn_tns = cx_Oracle.makedsn('172.18.0.3', '1521', service_name='free')
    conn = cx_Oracle.connect(user='system', password='zayro', dsn=dsn_tns)
    cursor = conn.cursor()
    cursor.execute('SELECT sysdate FROM dual')
    result = cursor.fetchone()
    print(f"Fecha en Oracle: {result[0]}")
    cursor.close()
    conn.close()

# Definir el DAG
with DAG(
    dag_id="cx_oracle_dag",
    schedule_interval="@daily",
    start_date=datetime(2024, 3, 1),
    catchup=False
) as dag:

    run_query = PythonOperator(
        task_id="execute_query",
        python_callable=execute_query
    )

    run_query
