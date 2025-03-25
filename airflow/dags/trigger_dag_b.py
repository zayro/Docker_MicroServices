from airflow.decorators import dag, task
from airflow.utils.dates import days_ago

@dag(schedule=None, start_date=days_ago(1), catchup=False)
def dag_b():
    @task
    def get_data_from_dag_a(**kwargs):
        conf = kwargs.get("dag_run").conf
        print(f"Mensaje recibido: {conf.get('message', 'Sin mensaje')}")

    get_data_from_dag_a()

dag_b_instance = dag_b()

