"""
Description: Aqui se conectara la base de datos
"""

import mysql.connector

# Configuración de la conexión
conexion = mysql.connector.connect(
    host="localhost",         # Dirección del servidor (localhost si está en tu PC)
    user="tu_usuario",        # Nombre de usuario de MySQL
    password="tu_contraseña", # Contraseña del usuario
    database="tu_base_de_datos" # Nombre de la base de datos
)

# Verificar si la conexión fue exitosa
if conexion.is_connected():
    print("Conexión exitosa a la base de datos")

cursor = conexion.cursor()
cursor.execute("SELECT * FROM tu_tabla")

# Obtener y mostrar los resultados
resultados = cursor.fetchall()
for fila in resultados:
    print(fila)

# Cerrar el cursor y la conexión
cursor.close()
conexion.close()