from airflow import DAG
from airflow.providers.oracle.hooks.oracle import OracleHook
from airflow.operators.python import PythonOperator
from datetime import datetime

def query_oracle():
    hook = OracleHook(oracle_conn_id="oracle_conn_id")
    sql = "SELECT sysdate FROM dual"
    result = hook.get_first(sql)  # Obtiene el primer resultado
    print(f"Fecha en Oracle: {result[0]}")


def query_oracle_dos():
    hook = OracleHook(oracle_conn_id="oracle-db")
    sql = "SELECT sysdate FROM dual"
    result = hook.get_first(sql)  # Obtiene el primer resultado
    print(f"Fecha en Oracle: {result[0]}")

# Definir el DAG
with DAG(
    dag_id="oracle_hook_dag",
    schedule_interval="@daily",
    start_date=datetime(2024, 3, 1),
    catchup=False
) as dag:

    run_query = PythonOperator(
        task_id="query_oracle",
        python_callable=query_oracle
    )

    run_query_dos = PythonOperator(
        task_id="query_oracle_dos",
        python_callable=query_oracle_dos
    )
    run_query >> run_query_dos
