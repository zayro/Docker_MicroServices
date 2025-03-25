import oracledb

conn = oracledb.connect(
    user="sytem",
    password="zayro",
    dsn="172.18.0.2:1521/free"
)
print("Conexión exitosa!")
conn.close()
