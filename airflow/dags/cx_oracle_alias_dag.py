from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime
import cx_Oracle

def execute_query():
    # Usar el alias 'free' definido en tnsnames.ora
    conn = cx_Oracle.connect(user='system', password='zayro', dsn='free')
    cursor = conn.cursor()
    cursor.execute('SELECT sysdate FROM dual')
    result = cursor.fetchone()
    print(f"Fecha en Oracle: {result[0]}")
    cursor.close()
    conn.close()

def execute_another_query():
    # Usar el alias 'another_db' definido en tnsnames.ora
    conn = cx_Oracle.connect(user='system', password='zayro', dsn='oracle-db')
    cursor = conn.cursor()
    cursor.execute('SELECT sysdate FROM dual')
    result = cursor.fetchone()
    print(f"Fecha en Oracle: {result[0]}")
    cursor.close()
    conn.close()

# Definir el DAG
with DAG(
    dag_id="cx_oracle_alias_dag",
    schedule_interval="@daily",
    start_date=datetime(2024, 3, 1),
    catchup=False
) as dag:

    run_query = PythonOperator(
        task_id="execute_query",
        python_callable=execute_query
    )
    
    run_another_query = PythonOperator(
        task_id="execute_another_query",
        python_callable=execute_another_query
    )

    run_query >> run_another_query
