-- MySQL Script generated by MySQL Workbench
-- Tue Dec  3 20:43:32 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cine` (
  `cine_id` INT NOT NULL AUTO_INCREMENT,
  `nombre_cine` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `codigo_postal` CHAR(5) NOT NULL,
  `calle` VARCHAR(100) NOT NULL,
  `colonia` VARCHAR(45) NOT NULL,
  `numero_local` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`cine_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Pelicula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pelicula` (
  `pelicula_id` INT NOT NULL AUTO_INCREMENT,
  `sinopsis` VARCHAR(1500) NOT NULL,
  `nombre_pelicula` VARCHAR(50) NOT NULL,
  `produccion` VARCHAR(400) NOT NULL,
  `clasificacion` VARCHAR(3) NOT NULL,
  `duracion` INT NOT NULL,
  `fecha_estreno` DATE NOT NULL,
  `fecha_salida` DATE NOT NULL,
  `estreno` TINYINT NOT NULL,
  `portada` VARCHAR(255) NOT NULL,
  `idioma` CHAR(3) NOT NULL,
  `formato` VARCHAR(15) NOT NULL,
  `genero` VARCHAR(45) NOT NULL,
  `garantia_cinepolis` TINYINT NOT NULL,
  PRIMARY KEY (`pelicula_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Sala`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Sala` (
  `sala_id` INT NOT NULL AUTO_INCREMENT,
  `tipo_sala` VARCHAR(15) NOT NULL,
  `numero_sala` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`sala_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Funcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Funcion` (
  `funcion_id` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `hora_inicio` TIME NOT NULL,
  `hora_termino` TIME NULL,
  `Cine_cine_id` INT NOT NULL,
  `Pelicula_pelicula_id` INT NOT NULL,
  `Sala_sala_id` INT NOT NULL,
  PRIMARY KEY (`funcion_id`, `Cine_cine_id`, `Pelicula_pelicula_id`, `Sala_sala_id`),
  UNIQUE INDEX `hora_termino_UNIQUE` (`hora_termino` ASC),
  INDEX `fk_Funcion_Cine_idx` (`Cine_cine_id` ASC),
  INDEX `fk_Funcion_Pelicula1_idx` (`Pelicula_pelicula_id` ASC),
  INDEX `fk_Funcion_Sala1_idx` (`Sala_sala_id` ASC),
  CONSTRAINT `fk_Funcion_Cine`
    FOREIGN KEY (`Cine_cine_id`)
    REFERENCES `mydb`.`Cine` (`cine_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcion_Pelicula1`
    FOREIGN KEY (`Pelicula_pelicula_id`)
    REFERENCES `mydb`.`Pelicula` (`pelicula_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcion_Sala1`
    FOREIGN KEY (`Sala_sala_id`)
    REFERENCES `mydb`.`Sala` (`sala_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Asiento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Asiento` (
  `asiento_id` INT NOT NULL AUTO_INCREMENT,
  `discapacitado` TINYINT NOT NULL,
  `disponible` TINYINT NOT NULL,
  `numero_asignado` VARCHAR(2) NOT NULL,
  `fila` CHAR(1) NOT NULL,
  `Sala_sala_id` INT NOT NULL,
  PRIMARY KEY (`asiento_id`, `Sala_sala_id`),
  INDEX `fk_Asiento_Sala1_idx` (`Sala_sala_id` ASC),
  CONSTRAINT `fk_Asiento_Sala1`
    FOREIGN KEY (`Sala_sala_id`)
    REFERENCES `mydb`.`Sala` (`sala_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tarjeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tarjeta` (
  `numero_tarjeta` INT NOT NULL AUTO_INCREMENT,
  `estado_activa` TINYINT NOT NULL,
  `codigo_qr` BLOB NOT NULL,
  PRIMARY KEY (`numero_tarjeta`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Venta` (
  `venta_id` INT NOT NULL AUTO_INCREMENT,
  `fecha_venta` DATETIME NOT NULL,
  `Tarjeta_numero_tarjeta` INT NOT NULL,
  PRIMARY KEY (`venta_id`, `Tarjeta_numero_tarjeta`),
  INDEX `fk_Venta_Tarjeta1_idx` (`Tarjeta_numero_tarjeta` ASC),
  CONSTRAINT `fk_Venta_Tarjeta1`
    FOREIGN KEY (`Tarjeta_numero_tarjeta`)
    REFERENCES `mydb`.`Tarjeta` (`numero_tarjeta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Boleto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Boleto` (
  `boleto_id` INT NOT NULL AUTO_INCREMENT,
  `codigo_qr` BLOB NOT NULL,
  `importe` DOUBLE NOT NULL,
  `numero_transaccion` VARCHAR(10) NOT NULL,
  `Venta_venta_id` INT NOT NULL,
  PRIMARY KEY (`boleto_id`, `Venta_venta_id`),
  INDEX `fk_Boleto_Venta1_idx` (`Venta_venta_id` ASC),
  CONSTRAINT `fk_Boleto_Venta1`
    FOREIGN KEY (`Venta_venta_id`)
    REFERENCES `mydb`.`Venta` (`venta_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Lugar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Lugar` (
  `lugar_id` INT NOT NULL AUTO_INCREMENT,
  `disponible` TINYINT NOT NULL,
  `Asiento_asiento_id` INT NOT NULL,
  `Asiento_Sala_sala_id` INT NOT NULL,
  `Boleto_boleto_id` INT NOT NULL,
  PRIMARY KEY (`lugar_id`, `Asiento_asiento_id`, `Asiento_Sala_sala_id`, `Boleto_boleto_id`),
  INDEX `fk_Lugar_Asiento1_idx` (`Asiento_asiento_id` ASC, `Asiento_Sala_sala_id` ASC),
  INDEX `fk_Lugar_Boleto1_idx` (`Boleto_boleto_id` ASC),
  CONSTRAINT `fk_Lugar_Asiento1`
    FOREIGN KEY (`Asiento_asiento_id` , `Asiento_Sala_sala_id`)
    REFERENCES `mydb`.`Asiento` (`asiento_id` , `Sala_sala_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Lugar_Boleto1`
    FOREIGN KEY (`Boleto_boleto_id`)
    REFERENCES `mydb`.`Boleto` (`boleto_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Categoria` (
  `categoria_id` INT NOT NULL AUTO_INCREMENT,
  `nombre_categoria` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`categoria_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Producto` (
  `producto_id` INT NOT NULL AUTO_INCREMENT,
  `nombre_producto` VARCHAR(40) NOT NULL,
  `descripcion` VARCHAR(255) NOT NULL,
  `imagen` VARCHAR(255) NOT NULL,
  `tamaño` VARCHAR(15) NULL,
  `sabor` VARCHAR(30) NULL,
  `precio` DOUBLE NOT NULL,
  `iva` FLOAT NOT NULL,
  `cantidad_productos` INT NOT NULL,
  `Categoria_categoria_id` INT NOT NULL,
  PRIMARY KEY (`producto_id`, `Categoria_categoria_id`),
  INDEX `fk_Producto_Categoria1_idx` (`Categoria_categoria_id` ASC),
  CONSTRAINT `fk_Producto_Categoria1`
    FOREIGN KEY (`Categoria_categoria_id`)
    REFERENCES `mydb`.`Categoria` (`categoria_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Producto_has_Producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Producto_has_Producto` (
  `Producto_producto_id` INT NOT NULL,
  `Producto_Categoria_categoria_id` INT NOT NULL,
  `Producto_producto_id1` INT NOT NULL,
  `Producto_Categoria_categoria_id1` INT NOT NULL,
  PRIMARY KEY (`Producto_producto_id`, `Producto_Categoria_categoria_id`, `Producto_producto_id1`, `Producto_Categoria_categoria_id1`),
  INDEX `fk_Producto_has_Producto_Producto2_idx` (`Producto_producto_id1` ASC, `Producto_Categoria_categoria_id1` ASC),
  INDEX `fk_Producto_has_Producto_Producto1_idx` (`Producto_producto_id` ASC, `Producto_Categoria_categoria_id` ASC),
  CONSTRAINT `fk_Producto_has_Producto_Producto1`
    FOREIGN KEY (`Producto_producto_id` , `Producto_Categoria_categoria_id`)
    REFERENCES `mydb`.`Producto` (`producto_id` , `Categoria_categoria_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Producto_has_Producto_Producto2`
    FOREIGN KEY (`Producto_producto_id1` , `Producto_Categoria_categoria_id1`)
    REFERENCES `mydb`.`Producto` (`producto_id` , `Categoria_categoria_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleado` (
  `empleado_id` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(30) NOT NULL,
  `paterno` VARCHAR(30) NOT NULL,
  `materno` VARCHAR(30) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  `salario` DOUBLE NOT NULL,
  `direccion` VARCHAR(255) NOT NULL,
  `telefono` CHAR(10) NOT NULL,
  `rfc` CHAR(12) NOT NULL,
  `Venta_venta_id` INT NOT NULL,
  `Venta_Tarjeta_numero_tarjeta` INT NOT NULL,
  PRIMARY KEY (`empleado_id`, `Venta_venta_id`, `Venta_Tarjeta_numero_tarjeta`),
  INDEX `fk_Empleado_Venta1_idx` (`Venta_venta_id` ASC, `Venta_Tarjeta_numero_tarjeta` ASC),
  CONSTRAINT `fk_Empleado_Venta1`
    FOREIGN KEY (`Venta_venta_id` , `Venta_Tarjeta_numero_tarjeta`)
    REFERENCES `mydb`.`Venta` (`venta_id` , `Tarjeta_numero_tarjeta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Punto_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Punto_venta` (
  `punto_venta_id` INT NOT NULL AUTO_INCREMENT,
  `numero_caja` VARCHAR(2) NOT NULL,
  `fondo_cambio` DOUBLE NOT NULL,
  `Cine_cine_id` INT NOT NULL,
  PRIMARY KEY (`punto_venta_id`, `Cine_cine_id`),
  INDEX `fk_Punto_venta_Cine1_idx` (`Cine_cine_id` ASC),
  CONSTRAINT `fk_Punto_venta_Cine1`
    FOREIGN KEY (`Cine_cine_id`)
    REFERENCES `mydb`.`Cine` (`cine_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Promocion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Promocion` (
  `promocion_id` INT NOT NULL AUTO_INCREMENT,
  `fecha_registro` DATE NOT NULL,
  `fecha_inicio` DATE NOT NULL,
  `fecha_expiracion` DATE NOT NULL,
  `tipo_promocion` VARCHAR(50) NOT NULL,
  `descripcion` VARCHAR(1200) NOT NULL,
  PRIMARY KEY (`promocion_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Promocion_has_Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Promocion_has_Cine` (
  `Promocion_promocion_id` INT NOT NULL,
  `Cine_cine_id` INT NOT NULL,
  PRIMARY KEY (`Promocion_promocion_id`, `Cine_cine_id`),
  INDEX `fk_Promocion_has_Cine_Cine1_idx` (`Cine_cine_id` ASC),
  INDEX `fk_Promocion_has_Cine_Promocion1_idx` (`Promocion_promocion_id` ASC),
  CONSTRAINT `fk_Promocion_has_Cine_Promocion1`
    FOREIGN KEY (`Promocion_promocion_id`)
    REFERENCES `mydb`.`Promocion` (`promocion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Promocion_has_Cine_Cine1`
    FOREIGN KEY (`Cine_cine_id`)
    REFERENCES `mydb`.`Cine` (`cine_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Promocion_has_Tarjeta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Promocion_has_Tarjeta` (
  `Promocion_promocion_id` INT NOT NULL,
  `Tarjeta_numero_tarjeta` INT NOT NULL,
  PRIMARY KEY (`Promocion_promocion_id`, `Tarjeta_numero_tarjeta`),
  INDEX `fk_Promocion_has_Tarjeta_Tarjeta1_idx` (`Tarjeta_numero_tarjeta` ASC),
  INDEX `fk_Promocion_has_Tarjeta_Promocion1_idx` (`Promocion_promocion_id` ASC),
  CONSTRAINT `fk_Promocion_has_Tarjeta_Promocion1`
    FOREIGN KEY (`Promocion_promocion_id`)
    REFERENCES `mydb`.`Promocion` (`promocion_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Promocion_has_Tarjeta_Tarjeta1`
    FOREIGN KEY (`Tarjeta_numero_tarjeta`)
    REFERENCES `mydb`.`Tarjeta` (`numero_tarjeta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Nivel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Nivel` (
  `nivel_id` INT NOT NULL AUTO_INCREMENT,
  `visitas_necesarias` INT NOT NULL,
  `porcentaje_acumulacion` FLOAT NOT NULL,
  PRIMARY KEY (`nivel_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cuenta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cuenta` (
  `cuenta_id` INT NOT NULL AUTO_INCREMENT,
  `contraseña` VARCHAR(30) NOT NULL,
  `apellido` VARCHAR(30) NOT NULL,
  `nombres` VARCHAR(30) NOT NULL,
  `sexo` CHAR(1) NOT NULL,
  `codigo_postal` CHAR(5) NOT NULL,
  `num_telefono` CHAR(10) NOT NULL,
  `ciudad` VARCHAR(30) NOT NULL,
  `pais` VARCHAR(20) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `puntos` INT NOT NULL,
  `Nivel_nivel_id` INT NOT NULL,
  `Tarjeta_numero_tarjeta` INT NOT NULL,
  PRIMARY KEY (`cuenta_id`, `Nivel_nivel_id`, `Tarjeta_numero_tarjeta`),
  INDEX `fk_Cuenta_Nivel1_idx` (`Nivel_nivel_id` ASC),
  INDEX `fk_Cuenta_Tarjeta1_idx` (`Tarjeta_numero_tarjeta` ASC),
  CONSTRAINT `fk_Cuenta_Nivel1`
    FOREIGN KEY (`Nivel_nivel_id`)
    REFERENCES `mydb`.`Nivel` (`nivel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cuenta_Tarjeta1`
    FOREIGN KEY (`Tarjeta_numero_tarjeta`)
    REFERENCES `mydb`.`Tarjeta` (`numero_tarjeta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`detalle_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`detalle_venta` (
  `Venta_venta_id` INT NOT NULL,
  `Venta_Tarjeta_numero_tarjeta` INT NOT NULL,
  `Producto_producto_id` INT NOT NULL,
  `Producto_Categoria_categoria_id` INT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`Venta_venta_id`, `Venta_Tarjeta_numero_tarjeta`, `Producto_producto_id`, `Producto_Categoria_categoria_id`),
  INDEX `fk_detalle_venta_Producto1_idx` (`Producto_producto_id` ASC, `Producto_Categoria_categoria_id` ASC),
  CONSTRAINT `fk_detalle_venta_Venta1`
    FOREIGN KEY (`Venta_venta_id` , `Venta_Tarjeta_numero_tarjeta`)
    REFERENCES `mydb`.`Venta` (`venta_id` , `Tarjeta_numero_tarjeta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalle_venta_Producto1`
    FOREIGN KEY (`Producto_producto_id` , `Producto_Categoria_categoria_id`)
    REFERENCES `mydb`.`Producto` (`producto_id` , `Categoria_categoria_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleado_Punto_venta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Empleado_Punto_venta` (
  `Empleado_empleado_id` INT NOT NULL,
  `Punto_venta_punto_venta_id` INT NOT NULL,
  `Punto_venta_Cine_cine_id` INT NOT NULL,
  `corte` DOUBLE NOT NULL,
  `fecha` DATE NOT NULL,
  `hora_inicio` TIME NOT NULL,
  `hora_salida` TIME NOT NULL,
  PRIMARY KEY (`Empleado_empleado_id`, `Punto_venta_punto_venta_id`, `Punto_venta_Cine_cine_id`),
  INDEX `fk_Empleado_has_Punto_venta_Punto_venta1_idx` (`Punto_venta_punto_venta_id` ASC, `Punto_venta_Cine_cine_id` ASC),
  INDEX `fk_Empleado_has_Punto_venta_Empleado1_idx` (`Empleado_empleado_id` ASC),
  CONSTRAINT `fk_Empleado_has_Punto_venta_Empleado1`
    FOREIGN KEY (`Empleado_empleado_id`)
    REFERENCES `mydb`.`Empleado` (`empleado_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Empleado_has_Punto_venta_Punto_venta1`
    FOREIGN KEY (`Punto_venta_punto_venta_id` , `Punto_venta_Cine_cine_id`)
    REFERENCES `mydb`.`Punto_venta` (`punto_venta_id` , `Cine_cine_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
