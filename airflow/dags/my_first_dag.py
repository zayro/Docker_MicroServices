from airflow import DAG
from airflow.operators.dummy_operator import DummyOperator
from airflow.operators.python_operator import PythonOperator
from airflow.plugins_manager import AirflowPlugin
from datetime import datetime

def print_hello():
    return 'Hello world!'

default_args = {
    'owner': 'airflow',
    'start_date': datetime(2023, 1, 1),
    'retries': 1,
}

with DAG('my_first_dag',
         default_args=default_args,
         schedule_interval='@daily',
         catchup=False) as dag:

    start = DummyOperator(task_id='start')
    hello_task = PythonOperator(task_id='hello_task', python_callable=print_hello)
    end = DummyOperator(task_id='end')

    start >> hello_task >> end
