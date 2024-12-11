"""
Description: Aqui se conectara la base de datos

Objetivo: Generar una clase "Sistema" que se conecte con la base de datos y permita las consultas

"""

import mysql.connector
from tkinter import messagebox

class System:
    def __init__(self):
        self.host = "localhost"
        self.user = "tu_usuario"
        self.psswd = "tu_contraseña"
        self.db = "tu_base_de_datos"
        self.status = False

    def conectarBaseDatos(self):
        # Configuración de la conexión
        try:
            self.conexion = mysql.connector.connect(
                host= self.host,         # Dirección del servidor (localhost si está en tu PC)
                user=self.user,        # Nombre de usuario de MySQL
                password= self.psswd, # Contraseña del usuario
                database= self.db # Nombre de la base de datos
            )
        except Exception as e:
            print(f"Advertencia, problema de conexion: {e}")
        
        # Verificar si la conexión fue exitosa
        # if True:
        try:
            if self.conexion.is_connected():
                self.status = True
            else:
                self.status = False
        except Exception as e:
            pass

        (messagebox.showinfo("Conexion exitosa",
                             "Se ha establecido conexion con la base de datos") 
         if self.status is True
         else messagebox.showerror("Error de conexion",
                                   "Ha ocurrido un error en la conexion con base de datos"))

    def consulta(self):
        cursor = self.conexion.cursor()
        cursor.execute("SELECT * FROM tu_tabla")

        # Obtener y mostrar los resultados
        resultados = cursor.fetchall()
        for fila in resultados:
            print(fila)

        # Cerrar el cursor y la conexión
        cursor.close()
        self.conexion.close()