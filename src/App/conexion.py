"""
Description: Aqui se conectara la base de datos

Objetivo: Generar una clase "Sistema" que se conecte con la base de datos y permita las consultas

"""

import mysql.connector
from tkinter import messagebox
import datetime

class System:
    def __init__(self):
        self.host = "localhost" # Estos se deben cambiar segun la base de datos
        self.user = "root"
        self.psswd = "12345"
        self.db = "cinepolis"
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
        self.show_tres_peliculas()
        
    def show_tres_peliculas(self):
        cursor = self.conexion.cursor()
        cursor.execute("SELECT nombre_pelicula FROM pelicula ORDER BY fecha_estreno DESC LIMIT 3;")
        resultados = cursor.fetchall()
        for fila in resultados:
            print(fila)
        cursor.close()

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