import cx_Oracle

# Configuración de la conexión
username = 'system'
password = 'zayro'
dsn = 'free'  # Data Source Name

# Crear la conexión
try:
    connection = cx_Oracle.connect(username, password, dsn)
    print("Conexión exitosa a Oracle Database")
except cx_Oracle.DatabaseError as e:
    error, = e.args
    print(f"Error al conectar a Oracle Database: {error.message}")
finally:
    if 'connection' in locals():
        connection.close()
        print("Conexión cerrada")