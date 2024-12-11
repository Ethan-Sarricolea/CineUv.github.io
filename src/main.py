"""
Description: Ejecucion de la app

"""

from App import gui, conexion

def main():
    global system 
    system = conexion.System()
    app = gui.app(system)
    app.run()

if (__name__ == "__main__"):
    main()
    system.conexion.close()
    print("Fin del programa")