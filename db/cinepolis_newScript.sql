CREATE DATABASE cinepolis;

USE cinepolis;

CREATE TABLE cine (
    cine_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(45) NOT NULL,
    calle VARCHAR(100) NOT NULL,
    numero_local VARCHAR(3) NULL,
    colonia VARCHAR(45) NOT NULL,
    codigo_postal CHAR(6) NOT NULL,
    ciudad VARCHAR(45) NOT NULL,
    estado VARCHAR(45) NOT NULL);

CREATE TABLE funcion (
    funcion_id INT AUTO_INCREMENT PRIMARY KEY,
    hora_inicio TIME NOT NULL,
    hora_termino TIME NOT NULL,
    fecha DATE NOT NULL);

CREATE TABLE sala (
    sala_id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_sala VARCHAR(15) NOT NULL,
    numero_sala VARCHAR(2) NOT NULL);

CREATE TABLE asiento (
    asiento_id INT AUTO_INCREMENT PRIMARY KEY,
    incapacitado BOOLEAN NOT NULL,
    disponible TINYINT(1) DEFAULT 1 NOT NULL,
    numero_asignados VARCHAR(2),
    sala_id INT, FOREIGN KEY (sala_id) REFERENCES sala(sala_id));
Query OK, 0 rows affected (0.027 sec)

CREATE TABLE tarjeta (
    numero_tarjeta INT PRIMARY KEY,
    estado_activa TINYINT(1) DEFAULT 1 NOT NULL,
    codigo_qr BLOB);
Query OK, 0 rows affected (0.011 sec)

CREATE TABLE nivel (
    nivel_id INT AUTO_INCREMENT PRIMARY KEY,
    visitas_necesarias INT NOT NULL,
    porcentaje_acumulacion FLOAT NOT NULL);

CREATE TABLE cuenta (
    cuenta_id INT AUTO_INCREMENT PRIMARY KEY,
    contraseña VARCHAR(30) NOT NULL,
    nombres VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    sexo CHAR(1) NOT NULL,
    codigo_postal CHAR(5) NOT NULL,
    telefono CHAR(10) NOT NULL,
    ciudad VARCHAR(30) NOT NULL,
    pais VARCHAR(20) NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    puntos INT DEFAULT 0 NOT NULL,
    nivel_id INT, FOREIGN KEY (nivel_id) REFERENCES nivel(nivel_id),
    numero_tarjeta INT, FOREIGN KEY (numero_tarjeta) REFERENCES tarjeta(numero_tarjeta));