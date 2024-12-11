"""
Description: Ejecucion de la app

"""

from App import gui, conexion

def main():
    system = conexion.System()
    app = gui.app(system)
    app.run()

if (__name__ == "__main__"):
    main()
    print("Fin del programa")