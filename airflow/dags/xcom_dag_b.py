from airflow.decorators import dag, task
from airflow.utils.dates import days_ago
from airflow.operators.dummy_operator import DummyOperator

@dag(schedule=None, start_date=days_ago(1), catchup=False)
def xcom_dag_b():
    start = DummyOperator(task_id='start')
    
    @task
    def pull_value(**kwargs):
        value = kwargs['ti'].xcom_pull(task_ids="push_value", dag_id="xcom_dag_a", key="message", include_prior_dates=True)
        print(f"Valor recibido: {value}")

    @task
    def pull_value_second(**kwargs):
        value = kwargs['ti'].xcom_pull(task_ids="push_value", key="message", include_prior_dates=True)
        print(f"Valor recibido: {value}")

    pull_value_task = pull_value()
    pull_value_second_task = pull_value_second()
    
    end = DummyOperator(task_id='end')

    start >> pull_value_task >> pull_value_second_task >> end

xcom_dag_b_instance = xcom_dag_b()


