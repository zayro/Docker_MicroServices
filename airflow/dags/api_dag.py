from airflow.decorators import dag, task
from airflow.utils.dates import days_ago

@dag(schedule=None, start_date=days_ago(1), catchup=False)
def api_dag():
    @task
    def print_param(**kwargs):
        my_param = kwargs["dag_run"].conf.get("my_param", "Valor por defecto")
        print(f"Parámetro recibido: {my_param}")

    print_param()

api_dag_instance = api_dag()
