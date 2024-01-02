/*drop database pruebaMoreno;*/
create database pruebaMoreno;
use pruebaMoreno;

CREATE TABLE IF NOT EXISTS `PruebaM` (
  `idMk` float NOT NULL auto_increment,
  `nombreP` VARCHAR(45) NOT NULL,
  `apellidoP` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMk`));
ALTER TABLE idMk AUTO_INCREMENT = 0;

/*------Registrar prueba----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarPrueba` $$
create procedure `registrarPrueba`(
	nombre VARCHAR(45),
    apellido VARCHAR(45)
) 
begin
	insert into PruebaM (nombreP, apellidoP) value (nombre, apellido); 
END$$
