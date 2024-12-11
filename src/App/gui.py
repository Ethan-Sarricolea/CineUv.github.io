"""
Description: Interfaz grafica
"""

from tkinter import *
import threading
import time
from PIL import Image, ImageTk

class app:
    def __init__(self, system):
        self.db_system = system
        self.X = 800
        self.Y = 500
        self.root = Tk()
        self.root.geometry(f"{self.X}x{self.Y}")
        self.root.title("Cinépolis")
        self.root.resizable(0,0)
        self.root.config(background="")

        # Widgets Menu principal
        # image = Image.open(r".\.\sources\Logo_cineuv.ico")
        # imagen_tk = ImageTk.PhotoImage(image)
        # self.logo_cinepolis = Label(self.root, image=imagen_tk)
        self.logo_cinepolis = Label(self.root, text="CINÉPOLIS", foreground="RoyalBlue1")

        self.frame_menu = Frame(background="blue2", width=self.X, height=50)
        self.boton_comprar_boleto = Button(self.root, text="Comprar boleto",
                                           background="RoyalBlue1", foreground="white")
        self.boton_ver_pelicula = Button(self.root, text="Ver peliculas",
                                         background="RoyalBlue1", foreground="white")
        self.boton_ver_productos = Button(self.root, text="Ver productos",
                                           background="RoyalBlue1", foreground="white")
        self.exit_button = Button(self.root, text="Salir", background="Red", foreground="white", command=self.exit)
        
    def showProductos(self):
        pass

    def showMenuPrincipal(self):
        self.frame_menu.place(x=0, y=0)
        MID = (self.X/2)
        self.logo_cinepolis.place(x=MID, y=100, anchor="center")
        self.boton_comprar_boleto.place(x=MID, y=150, anchor="center")
        self.boton_ver_pelicula.place(x=MID, y=200, anchor="center")
        self.boton_ver_productos.place(x=MID, y=250, anchor="center")
        self.exit_button.place(x = MID, y = 300, anchor="center")

    def conexion(self):
        hilo = threading.Thread(target=self.db_system.conectarBaseDatos)
        hilo.start()
        print("Conectando con la base de datos...")

    def exit(self):
        self.root.quit()

    def run(self):
        self.showMenuPrincipal()
        self.conexion()
        self.root.mainloop()