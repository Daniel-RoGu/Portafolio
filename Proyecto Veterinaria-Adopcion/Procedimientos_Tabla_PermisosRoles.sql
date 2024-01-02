USE `adopciones`;

/*------Registrar PermisosRoles----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarPermisoRol` $$
create procedure `registrarPermisoRol`(
	nombrePermiso varchar(45),
    nombreRol varchar(45),
    carpetaRaiz varchar(80),
    nombreInterfaz varchar(80)
) 
begin
	insert into Permisos_Roles (fk_idPermisos, fk_idRol, vista_raiz, vista) 
    values (ObtenerIdPermiso(nombrePermiso), ObtenerIdRol(nombreRol), carpetaRaiz, nombreInterfaz);
END$$

/*------Eliminar PermisosRoles----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `eliminarPermisoRol` $$
create procedure `eliminarPermisoRol`(
	IN nomRol varchar(45),
    IN nomPermiso varchar(45)
) 
begin
	declare rolId int;
    declare permisoid int;
    set rolId = ObtenerIdRol(nomRol);
    set permisoid = ObtenerIdPermiso(nomPermiso);
	delete from Permisos_Roles where `fk_idPermisos` = permisoid and `fk_idRol` = rolId;
END$$

/*------Mostrar PermisosRoles----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `mostrarPermisosRoles` $$
create procedure `mostrarPermisosRoles`() 
begin
	select * from Permisos_Roles;
END$$

/*------Editar PermisosRoles----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `editarPermisosRoles` $$
create procedure `editarPermisosRoles`(
	IN nomRol varchar(80),
    nomPermiso varchar(80),
    nuevoRol varchar(80),
    nuevaRaiz varchar(80),
    nuevaInterfaz varchar(80)
) 
begin
	declare rolId int;
    declare permisoid int;
    set rolId = ObtenerIdRol(nomRol);
    set permisoid = ObtenerIdPermiso(nomPermiso);
	update Permisos_Roles set `fk_idRol` = ObtenerIdRol(nuevoRol), `vista_raiz` = nuevaRaiz, `vista` = nuevaInterfaz
    where `fk_idPermisos` = permisoid and `fk_idRol` = rolid;
END$$