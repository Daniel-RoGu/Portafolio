USE `adopciones`;

/*------Registrar Roles----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarRol` $$
create procedure `registrarRol`(
	nomRol varchar(45)
) 
begin
	insert into Roles (nombreRol, estadoRol) values (nomRol, "Habilitado");
END$$

/*------Eliminar Roles----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `eliminarRol` $$
create procedure `eliminarRol`(
	IN nomRol varchar(45)
) 
begin
	declare rolId int;
    set rolId = (select `idRol` from Roles
						where Roles.`nombreRol` = nomRol);
	delete from Roles where `idRol` = rolId;
END$$

/*------Mostrar Roles----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `mostrarRoles` $$
create procedure `mostrarRoles`() 
begin
	select * from Roles;
END$$

/*------Editar Roles----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `editarRoles` $$
create procedure `editarRoles`(
	IN nomRol varchar(80),
    nuevoNombre varchar(80),
    nuevoEstado varchar(20)
) 
begin
	declare rolid int;
    set rolid = (select `idRol` from Roles where `nombreRol` = nomRol);
	update Roles set `nombreRol` = nuevoNombre, `estadoRol` = nuevoEstado
    where `idRol` = rolid;
END$$