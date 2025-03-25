from airflow.decorators import dag
from airflow.operators.trigger_dagrun import TriggerDagRunOperator
from airflow.utils.dates import days_ago
from airflow.operators.dummy_operator import DummyOperator

@dag(schedule=None, start_date=days_ago(1), catchup=False)
def dag_a():
    # task 1
    start = DummyOperator(task_id='start')
    
    # task 2
    task_trigger_dag_a = TriggerDagRunOperator(
        task_id="task_trigger_dag_a",
        trigger_dag_id="dag_b",
        conf={"message": "Hola desde DAG A"},
    )
    
    # task 3
    end = DummyOperator(task_id='end')

    start >> task_trigger_dag_a >> end

dag_a_instance = dag_a()




