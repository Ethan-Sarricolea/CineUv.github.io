/**
 * Description: Aqui se tomaran y mostraran los datos de las promociones
 * Author: Yael Franco Toledo
 */
function cargarPromociones() {
    // Cargar datos del archivo JSON
    fetch('db/promociones.json') 
      .then(response => {
        if (!response.ok) {
          throw new Error(`HTTP error! status: ${response.status}`);
        }
        return response.json();
      })
      .then(datos => mostrarPromociones(datos))
      .catch(error => console.error('Error al cargar el archivo JSON:', error));
  }
  
  function mostrarPromociones(promociones) {
    const contenedor = document.getElementById('promociones'); // Contenedor corregido
  
    promociones.forEach(promocion => {
      const promocionDiv = document.createElement('div');
      promocionDiv.classList.add('promocion'); // Clase consistente con CSS
  
      // Crear imagen
      const imagen = document.createElement('img');
      imagen.src = promocion.imagen;
      imagen.alt = promocion.nombre;
      promocionDiv.appendChild(imagen);
  
      // Crear título
      const titulo = document.createElement('h3');
      titulo.textContent = promocion.nombre;
      promocionDiv.appendChild(titulo);
  
      // Crear descripción
      const descripcion = document.createElement('p');
      descripcion.textContent = promocion.descripcion;
      promocionDiv.appendChild(descripcion);
  
      // Agregar promoción al contenedor
      contenedor.appendChild(promocionDiv);
    });
  }
  
  // Llamar la función al cargar la página
  document.addEventListener('DOMContentLoaded', cargarPromociones); 