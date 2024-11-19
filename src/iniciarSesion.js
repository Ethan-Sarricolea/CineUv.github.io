/**
 * Description: Este script buscara en el archivo JSON y encontrara un usuario para 
 * su inicio de sesion por su correo y contraseña
 * Author: Elias
 */

//
const loginForm = document.getElementById("login-form");
const messageElement = document.getElementById("message");
const userInfoContainer = document.getElementById("user-info");

// Mapear género para mostrarlo correctamente
const mapearGenero = (genero) => (genero === 1 ? "Masculino" : "Femenino");

// Cargar usuarios desde el archivo JSON
let usuarios = [];
fetch('../db/usuario.json')
  .then((response) => {
    if (!response.ok) {
      throw new Error("Error al conectar con base de datos"); // Generar un error de conexion
    }
    return response.json();
  })
  .then((data) => {
    usuarios = data;
  })
  .catch((error) => {
    console.error("Error al cargar los datos:", error);
  });

// Manejar el envío del formulario
loginForm.addEventListener("submit", function (event) {
  event.preventDefault(); // Evitar recargar la página

  const emailInput = document.getElementById("email").value.trim();
  const passwordInput = document.getElementById("password").value.trim();

  // Buscar usuario en el JSON
  const usuarioEncontrado = usuarios.find(
    (usuario) =>
      usuario.correo == emailInput && usuario.contraseña == passwordInput
  );

  if (usuarioEncontrado) {
    // Inicio de sesión exitoso
    messageElement.textContent = "¡Inicio de sesión exitoso!";
    messageElement.style.color = "green";

    // Mostrar la información del usuario
    userInfoContainer.style.display = "block";
    document.getElementById("nombre").textContent = usuarioEncontrado.nombre;
    document.getElementById("apellido").textContent = usuarioEncontrado.apellido;
    document.getElementById("genero").textContent = mapearGenero(
      usuarioEncontrado.genero
    );

    // verificar si hay un id
    // Guardar el id en info.json
    // Checar si hay un id y de haberlo obtiene la informacion de usuario.json
    
    document.getElementById("nacimiento").textContent =
      usuarioEncontrado.nacimiento;
    document.getElementById("codigo_postal").textContent =
      usuarioEncontrado.codigo_postal;
    document.getElementById("ciudad").textContent = usuarioEncontrado.ciudad;
    document.getElementById("pais").textContent = usuarioEncontrado.pais;
    document.getElementById("num_telefono").textContent =
      usuarioEncontrado.num_telefono;
  } else {
    // Error en el inicio de sesión
    messageElement.textContent = "Correo o contraseña incorrectos.";
    messageElement.style.color = "red";

    // Ocultar información de usuario en caso de error
    userInfoContainer.style.display = "none";
  }
});
