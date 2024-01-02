USE `adopciones`;

/*------Registrar Raza----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarRaza` $$
create procedure `registrarRaza`(
	nombreRaza varchar(45)
) 
begin
	insert into Raza (nombreRaza, estadoRaza) values (nombreRaza, "No-Disponible");
END$$

/*------Eliminar Raza----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `eliminarRaza` $$
create procedure `eliminarRaza`(
	IN nomRaza varchar(45)
) 
begin
	declare razaId int;
    set razaId = (select `idRaza` from Raza
						where Raza.`nombreRaza` = nomRaza);
	delete from Raza where `idRaza` = razaId;
END$$

/*------Mostrar tipoDocumento----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `mostrarRaza` $$
create procedure `mostrarRaza`() 
begin
	select * from Raza;
END$$

