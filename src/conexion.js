/**
 * Conexion con base de datos
 * 
 */

const express = require('express');
const mysql = require('mysql2');
const app = express();

// conexion
const conexion = mysql.createConnection({
    host: 'localhost', 
    user: 'root', 
    password: '12345', 
    database: 'cinepolis'
  });

  conexion.connect((error) => {
    if (error) {
      console.error('Error al conectar a la base de datos:', error);
      return;
    }
    console.log('Conexión exitosa a la base de datos MySQL');
  });

/**
 * Funciones de consultas de datos
 */

// Funcion de obtener 6 peliculas

function pelicula_menu_principal(){
    // Realizar una consulta SELECT
    conexion.query('SELECT nombre_pelicula, portada FROM pelicula ORDER BY fecha_estreno DESC LIMIT 5;',
            (error, resultados, campos) => {
        if (error) {
        console.error('Error en la consulta:', error);
        return;
        }
    
        // Mostrar los resultados
        console.log('Resultados:', resultados);
    
        // Mostrar los campos (opcional, para ver la estructura de las columnas)
        console.log('Campos:', campos);
    });
    
    // Cerrar la conexión (opcional, pero recomendado)
    conexion.end((error) => {
        if (error) {
        console.error('Error al cerrar la conexión:', error);
        return;
        }
        console.log('Conexión cerrada');
    });
}