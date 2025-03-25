from airflow.decorators import dag, task
from airflow.utils.dates import days_ago

@dag(schedule=None, start_date=days_ago(1), catchup=False)  # catchup=False desactiva la ejecución de tareas pasadas
def example_dag():
    @task
    def hello_world():
        print("Hola, mundo!")

    hello_world()

example_dag_instance = example_dag()
