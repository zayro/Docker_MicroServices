from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.operators.dummy_operator import DummyOperator
from datetime import datetime

def process_records(**kwargs):
    ti = kwargs['ti']
    records = ti.xcom_pull(dag_id='subfolder.query_dag', task_ids='query_demo_table', key='records')
    if records is None:
        raise ValueError("No records found in XCom")
    for record in records:
        # Procesar cada registro
        print(f"Procesando registro: {record}")

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2023, 1, 1),
    'retries': 1,
}

with DAG('process_dag', default_args=default_args, schedule_interval='@daily', catchup=False) as dag:
    start = DummyOperator(task_id='start')

    process_task = PythonOperator(
        task_id='process_records',
        python_callable=process_records,
        provide_context=True
    )

    verify = DummyOperator(task_id='verify')

    end = DummyOperator(task_id='end')

    start >> process_task >> verify >> end
