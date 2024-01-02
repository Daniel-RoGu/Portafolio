/*------Registrar Usuario----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarUsuario` $$
create procedure `registrarUsuario`(
	identificacion int,
	nombre varchar(45),
    apellido varchar(45),
    edad int,
    tpDocumento varchar(45),
    telefono varchar(10),
    ubicacion varchar(100),
    correo varchar(100),
	nomUsuario varchar(40),
    pass varchar(40),
    rol varchar(40)
) 
begin
	call registrarPersona(identificacion, nombre, apellido, edad, tpDocumento, telefono, ubicacion, correo);
	insert into Usuario (nombreUsuario, contrasenaUsuario, estadoUsuario, fk_idRol, fk_idPersona) 
    values (nomUsuario, pass, "Activo", ObtenerIdRol(rol), identificacion);
END$$

/*------Eliminar Usuario----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `eliminarUsuario` $$
create procedure `eliminarUsuario`(
	IN nomUsuario varchar(40)
) 
begin
	declare documento int;
    declare celular varchar(12);
    declare correo varchar(40);
    set documento = (select fk_idPersona from Usuario where nombreUsuario = nomUsuario);
    set celular = (select c.numero from Usuario as u
				    inner join Persona as p on u.fk_idPersona = p.idPersona
                    inner join Celular as c on c.Persona_idPersona = p.idPersona);
	set correo = (select cp.correoPersona from Usuario as u
				    inner join Persona as p on u.fk_idPersona = p.idPersona
                    inner join CorreoPersona as cp on cp.Persona_idPersona = p.idPersona);
    delete from Usuario where `idUsuario` = (select ObtenerIdUsuario(nomUsuario));
	call eliminarPersona(documento, celular, correo);
END$$

/*------Mostrar Usuario----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `mostrarUsuario` $$
create procedure `mostrarUsuario`() 
begin
	select nombreUsuario as Usuario, estadoUsuario as Cuenta from Usuario;
END$$

/*------Editar Usuario----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `editarUsuario` $$
create procedure `editarUsuario`(
	IN nomUsuario varchar(40),
    nuevoNomUsuario varchar(40),
    nuevaPassUsuario varchar(40),
    nombreModificado varchar(40),
    apellidoModificado varchar(40),
    edadModificada int,
    nuevoCelular varchar(12),
    nuevaUbicacion varchar(100),
    nuevoCorreo varchar(40)
) 
begin
	declare documento int;
    set documento = (select fk_idPersona from Usuario where nombreUsuario = nomUsuario);
    update Usuario set nombreUsuario = nuevoNomUsuario, contrasenaUsuario = nuevaPassUsuario
    where idUsuario = (select ObtenerIdUsuario("nomUsuario"));
    call editarPersona(documento, nombreModificado, apellidoModificado, edadModificada, nuevoCelular,
					    nuevaUbicacion, nuevoCorreo);
END$$

