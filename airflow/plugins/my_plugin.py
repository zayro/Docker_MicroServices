from airflow.plugins_manager import AirflowPlugin

class MyCustomPlugin(AirflowPlugin):
    name = "my_custom_plugin"
    # Aquí puedes agregar tus operadores, sensores, hooks, etc.
