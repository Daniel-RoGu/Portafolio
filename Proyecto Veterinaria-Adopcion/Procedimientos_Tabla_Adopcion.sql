/*------Registrar Adopcion----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarAdopcion` $$
create procedure `registrarAdopcion`(
	fechaInicioAdopt varchar(40),
    nomAdopta varchar(45),
    apellidoAdopt varchar(45),
    cellAdopta varchar(45),
    identificacionAdopta varchar(45),
    TpDocAdopta varchar(10),
    estadoAdopt varchar(45),
    nomMascota varchar(45)
) 
begin
	insert into Adopcion(fechaInicioAdopcion, fechaFinAdopcion, nombreAdopta, apellidoAdopta, celularAdopta,
						   documentoAdopta, TpDocumentoAdopta, estadoAdopcion, fk_idMascota)
				value(fechaInicioAdopt, null, nomAdopta, apellidoAdopt, cellAdopta, identificacionAdopta,
					   TpDocAdopta, estadoAdopt, (select ObtenerIdMascota(nomMascota)));
END$$

/*------Editar Adopcion----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `editarAdopcion` $$
create procedure `editarAdopcion`(
	fechaFinAdopt varchar(45),
    estadoAdopt varchar(45),
    nomMascota varchar(45)
) 
begin
	 update Adopcion set fechaFinAdopcion = fechaFinAdopt, estadoAdopcion = estadoAdopt
	 where idAdopcion = (select ObtenerIdAdopcionMascota(nomMascota));
END$$

/*------Mostrar Adopciones----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `mostrarAdopciones` $$
create procedure `mostrarAdopciones`() 
begin
	 select m.nombreMascota, a.fechaInicioAdopcion, a.fechaFinAdopcion, a.nombreAdopta, a.apellidoAdopta, a.celularAdopta,
			a.estadoAdopcion
	 from Adopcion as a
     inner join Mascota as m on a.fk_idMascota = m.idMascota;
END$$

/*------Mostrar Adopciones----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `mostrarAdopcion` $$
create procedure `mostrarAdopcion`(
	IN nomMascota varchar(40)
) 
begin
	 select m.nombreMascota, a.fechaInicioAdopcion, a.fechaFinAdopcion, a.nombreAdopta, a.apellidoAdopta, a.celularAdopta,
			a.estadoAdopcion
	 from Mascota as m
     inner join Adopcion as a on a.fk_idMascota = m.idMascota
     where m.idMascota = (select ObtenerIdMascota(nomMascota));
END$$