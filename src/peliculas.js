/**
 * Description : Aqui se tomarán los datos que representan a la base de datos (los archivos json)
 * Author: Ethan YAhel Sarricolea Cortés
 */

// Función para cargar el archivo JSON
function cargarPeliculas() {
    fetch('db/peliculas.json')
      .then(response => response.json())  // Convertimos la respuesta a un objeto JSON
      .then(datos => mostrarPeliculas(datos))  // Llamamos a la función para mostrar las películas
      .catch(error => console.error('Error al cargar el archivo JSON:', error));  // Si hay un error
  }
  
  // Función para mostrar las películas en la página
  function mostrarPeliculas(peliculas) {
    const contenedor = document.getElementById('peliculas');
  
    peliculas.forEach(pelicula => {
      const peliculaDiv = document.createElement('div');
      peliculaDiv.classList.add('pelicula');
      
      // Crear imagen de la película
      const imagen = document.createElement('img');
      imagen.src = pelicula.portada;
      imagen.alt = pelicula.nombre;
      peliculaDiv.appendChild(imagen);
  
      // Crear título de la película
      const titulo = document.createElement('h3');
      titulo.textContent = pelicula.nombre;
      peliculaDiv.appendChild(titulo);
  
    //   // Crear descripción de la película
    //   const descripcion = document.createElement('p');
    //   descripcion.textContent = pelicula.sinopsis;
    //   peliculaDiv.appendChild(descripcion);
  
      // Crear botón de compra
      const boton = document.createElement('button');
      boton.textContent = 'Comprar Boletos';
      peliculaDiv.appendChild(boton);
  
      // Agregar el div de la película al contenedor
      contenedor.appendChild(peliculaDiv);
    });
  }
  
  // Llamar a la función cuando la página esté cargada
  document.addEventListener('DOMContentLoaded', cargarPeliculas);
  