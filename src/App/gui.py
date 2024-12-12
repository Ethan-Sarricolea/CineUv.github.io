"""
Description: Interfaz grafica
"""

from tkinter import *
import threading
import time
from PIL import Image, ImageTk
from io import BytesIO
import requests

class app:
    def __init__(self, system):
        self.db_system = system
        self.X = 800
        self.Y = 400
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
                                           background="RoyalBlue1", foreground="white",
                                           command = self.shoComprarBoleto)
        self.boton_ver_pelicula = Button(self.root, text="Ver peliculas",
                                         background="RoyalBlue1", foreground="white")
        self.boton_ver_productos = Button(self.root, text="Ver productos",
                                           background="RoyalBlue1", foreground="white")
        self.exit_button = Button(self.root, text="Salir", background="Red", foreground="white", command=self.exit)
        self.label_imagen = Label(self.root)
        self.label_imagen2 = Label(self.root)
        
    def showPeliculasMenu(self, pelicula):
        img_url = pelicula[0][0] # Aquí va tu enlace directo
        image2_url = pelicula[1][0]
        img = Image.open(BytesIO(requests.get(img_url).content))
        imagen_redimensionada = img.resize((130, 200)) 
        img_tk = ImageTk.PhotoImage(imagen_redimensionada)
        self.label_imagen.config(image=img_tk)
        self.label_imagen.image = img_tk

        img = Image.open(BytesIO(requests.get(image2_url).content))
        imagen_redimensionada = img.resize((130, 200)) 
        img_tk = ImageTk.PhotoImage(imagen_redimensionada)
        self.label_imagen2.config(image=img_tk)
        self.label_imagen2.image = img_tk
        print("imagenes mostradas")

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
        self.label_imagen.place(x=(self.X - (self.X/4)), y=100)
        self.label_imagen2.place(x=(self.X/10), y=100)

    def conexion(self):
        hilo = threading.Thread(target=self.db_system.conectarBaseDatos)
        hilo.start()
        print("Conectando con la base de datos...")

    def limpiar_ventana(self):
        for widget in self.root.winfo_children():  # Obtener todos los widgets hijos de la ventana
            print("borrado")
            widget.place_forget()  # Quitar cada widget
        self.root.update_idletasks()

    def shoComprarBoleto(self):     # Errorrr????????????
        self.root.after(100, self.limpiar_ventana)
        print("limpio")

    def exit(self):
        self.root.quit()

    def run(self):
        self.showMenuPrincipal()
        self.conexion()
        self.showPeliculasMenu(self.db_system.getPelicula())
        self.root.mainloop()