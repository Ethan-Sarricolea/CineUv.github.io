# CineUv

Proyecto de base de datos de un cine cimilar a Cinepolis

## Objetivos
Generar una interfaz fiel al proyecto que permita la emulación del funcionamiento real de una pagina web con acceso a bases de datos.

## Detalles a tomar en cuenta

Si no hay conexion a internet o el servidor no esta prendido, habra un error de conexion y el codigo se mantendra en bucle.

### Consultas

- Las 2 ultimas peliculas
- Las sucursales disponibles = SELECT cine_id, nombre_cine FROM cine
    Guardar el cine seleccionado en una variable temporal para pasarlo a la siguiente consulta, es decir, un arreglo con id y nombre para comparar el id
- **Mostrar las peliculas y sus funciones de la fecha actual**
- Segun la funcion seleccionada mostrar los lugares disponibles.
- Segun los lugares seleccionados (los que estan disponibles estan en 0) cambiar
    su status a 1
- Luego se debe:
  - generar una venta
  - generar un boleto
  - 

## Dependencias

Pillow: `pip install pillow`
Requsest: `pip install requests`
Mysql: `pip install mysql-connector-python`

## Acceso

1. Escribe el siguiente enlace: `https://ethan-sarricolea.github.io/CineUv.github.io/`

2. [Haz click aqui](https://ethan-sarricolea.github.io/CineUv.github.io/)

## Pendientes

- Pregunta. (Que necesita hacer la interfaz?)
  - comprar una funcion
  - ver funciones
  - ver peliculas