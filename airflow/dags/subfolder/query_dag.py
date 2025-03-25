from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.trigger_dagrun import TriggerDagRunOperator
from airflow.hooks.oracle_hook import OracleHook
from datetime import datetime

def query_demo_table(**kwargs):
    oracle_hook = OracleHook(oracle_conn_id='oracle-db')
    connection = oracle_hook.get_conn()
    cursor = connection.cursor()
    cursor.execute("SELECT * FROM demo")
    records = cursor.fetchall()
    cursor.close()
    connection.close()
    # Almacenar los registros en XCom
    kwargs['ti'].xcom_push(key='records', value=records)
    return records

def print_records(**kwargs):
    ti = kwargs['ti']
    records = ti.xcom_pull(task_ids='query_demo_table', key='records')
    for record in records:
        print(record)

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2023, 1, 1),
    'retries': 1,
}

with DAG('query_dag', default_args=default_args, schedule_interval='@daily', catchup=False) as dag:
    start = DummyOperator(task_id='start')

    query_task = PythonOperator(
        task_id='query_demo_table',
        python_callable=query_demo_table,
        provide_context=True
    )

    print_task = PythonOperator(
        task_id='print_records',
        python_callable=print_records,
        provide_context=True
    )

    trigger_process_dag = TriggerDagRunOperator(
        task_id='trigger_process_dag',
        trigger_dag_id='process_dag',
        conf={"message": "triggered by query_dag"}
    )

    end = DummyOperator(task_id='end')

    start >> query_task >> print_task >> trigger_process_dag >> end
