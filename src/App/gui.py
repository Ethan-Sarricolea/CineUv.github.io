"""
Description: Interfaz grafica
"""

from tkinter import *

class app:
    def __init__(self):
        self.root = Tk()
        self.root.geometry("500x500")
        self.root.title("CineUV")
        self.root.resizable(0,0)

    def run(self):
        self.root.mainloop()