from airflow import DAG
from airflow.providers.common.sql.operators.sql import SQLExecuteQueryOperator
from airflow.utils.dates import days_ago

default_args = {
    'owner': 'airflow',
    'start_date': days_ago(1),
}

with DAG(
    dag_id='test_oracle_connection_1_dag',
    default_args=default_args,
    schedule_interval=None,
    catchup=False,
) as dag:

    test_oracle_connection_1 = SQLExecuteQueryOperator(
        task_id='test_oracle_connection',
        conn_id='oracle_conn_id',  # Asegúrate de que esta conexión esté configurada en la interfaz de Airflow
        sql='SELECT 1 FROM dual',
    )


    test_oracle_connection_1