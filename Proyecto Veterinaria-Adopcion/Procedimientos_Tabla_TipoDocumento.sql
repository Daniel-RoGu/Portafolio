
USE `adopciones`;

/*------Registrar tipoDocumento----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarTpDocumento` $$
create procedure `registrarTpDocumento`(
	nombreDocumento varchar(45)
) 
begin
	insert into Tipo_Documento (tipoDocumento, estadoDocumento) values (nombreDocumento, "Activo");
END$$

/*------Eliminar tipoDocumento----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `eliminarTpDocumento` $$
create procedure `eliminarTpDocumento`(
	IN nombreDocumento varchar(45)
) 
begin
	declare idTpdocumento int;
    set idTpdocumento = (select idTipoDocumento from Tipo_documento 
						where Tipo_documento.`tipoDocumento` = nombreDocumento);
	delete from Tipo_Documento where `idTipoDocumento` = idTpdocumento;
END$$

/*------Mostrar tipoDocumento----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `mostrarTpDocumento` $$
create procedure `mostrarTpDocumento`() 
begin
	select * from Tipo_Documento;
END$$

call mostrarTPDocumento();