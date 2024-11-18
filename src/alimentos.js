/**
 * Description: Aqui se tomarán los alimentos del archivo JSON y se mostraran en HTML por medio del script JS
 * Author: Abraham
 */
// Función para cargar el archivo JSON
function cargarAlimentos() {
    fetch('/db/combos.json')
      .then(response => response.json())  // Convertimos la respuesta a un objeto JSON
      .then(datos => mostrarAlimentos(datos))  // Llamamos a la función para mostrar los alimentos
      .catch(error => console.error('Error al cargar el archivo JSON:', error));  // Si hay un error
  }
  
  // Función para mostrar las películas en la página
  function mostrarAlimentos(combos) {
    const contenedor = document.getElementById('lista-alimentos');
    console.log(combos)
    
    combos.forEach(combo => {
      const alimentoDiv = document.createElement('div');
      alimentoDiv.classList.add('producto');
      
      // Crear imagen del alimento
      const imagen = document.createElement('img');
      imagen.src = combo.imagen;
      imagen.alt = combo.nombre;
      alimentoDiv.appendChild(imagen);

      // Crear div info-producto
      const infoDiv = document.createElement('div');
      infoDiv.classList.add('info-producto');
      
  
      // Crear título del producto
      const titulo = document.createElement('h3');
      titulo.textContent = combo.nombre;
      infoDiv.appendChild(titulo);

      // Agregar descripcion
      const descripcion = document.createElement('p');
      descripcion.textContent = combo.descripcion;
      infoDiv.appendChild(descripcion);

      // Agregar precio
      const precio = document.createElement('p');
      const strong = document.createElement('strong');
      strong.textContent = 'Precio: ';
      precio.appendChild(strong);
      precio.appendChild(document.createTextNode(combo.precio))
      infoDiv.appendChild(precio);

      // Anidar informacion del producto al alimento
      alimentoDiv.appendChild(infoDiv);

      // Agregar el div del alimento al contenedor
      contenedor.appendChild(alimentoDiv);
    });
  }
  
  // Llamar a la función cuando la página esté cargada
  document.addEventListener('DOMContentLoaded', cargarAlimentos);