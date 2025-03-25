from airflow.decorators import dag, task
from airflow.utils.dates import days_ago

@dag(schedule=None, start_date=days_ago(1), catchup=False)
def xcom_dag_a():
    @task
    def push_value():
        return {"message": "Hola desde DAG A"}

    push_value()

xcom_dag_a_instance = xcom_dag_a()
