USE `adopciones`;

/*------Registrar TipoMascota----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarTpMascota` $$
create procedure `registrarTpMascota`(
	nombreTpMascota varchar(45)
) 
begin
	insert into Tipo_Mascota (tipoMascota, estadoTipoMascota) values (nombreTpMascota, "No-Disponible");
END$$

/*------Eliminar Raza----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `eliminarTpMascota` $$
create procedure `eliminarTpMascota`(
	IN nomTpMascota varchar(45)
) 
begin
	declare TpMascotaId int;
    set TpMascotaId = (select `idTipoMascota` from Tipo_Mascota
						where Tipo_Mascota.`tipoMascota` = nomTpMascota);
	delete from Tipo_Mascota where `idTipoMascota` = TpMascotaId;
END$$

/*------Mostrar tipoDocumento----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `mostrarTpMascota` $$
create procedure `mostrarTpMascota`() 
begin
	select * from Tipo_Mascota;
END$$