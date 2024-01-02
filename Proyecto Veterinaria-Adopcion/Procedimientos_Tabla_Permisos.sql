USE `adopciones`;

/*------Registrar Permisos----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarPermiso` $$
create procedure `registrarPermiso`(
	nomPermiso varchar(45)
) 
begin
	insert into Permisos (nombrePermiso, estadoPermiso) values (nomPermiso, "Habilitado");
END$$

/*------Eliminar Permisos----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `eliminarPermiso` $$
create procedure `eliminarPermiso`(
	IN nomPermiso varchar(45)
) 
begin
	declare permisoId int;
    set permisoId = (select `idPermisos` from Permisos
						where Permisos.`nombrePermiso` = nomPermiso);
	delete from Permisos where `idPermisos` = permisoId;
END$$

/*------Mostrar Permisos----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `mostrarPermiso` $$
create procedure `mostrarPermiso`() 
begin
	select * from Permisos;
END$$

/*------Editar Permiso----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `editarPermiso` $$
create procedure `editarPermiso`(
	IN nomPermiso varchar(80),
    nuevoNombre varchar(80),
    nuevoEstado varchar(20)
) 
begin
	declare permisoid int;
    set permisoid = (select `idPermisos` from Permisos where `nombrePermiso` = nomPermiso);
	update Permisos set `nombrePermiso` = nuevoNombre, `estadoPermiso` = nuevoEstado
    where `idPermisos` = permisoid;
END$$