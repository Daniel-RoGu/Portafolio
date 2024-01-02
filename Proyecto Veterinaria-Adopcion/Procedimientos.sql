USE `adopciones`;

/*---------------------------PROCEDIMIENTOS PARA INSERTAR--------------------------------------*/

/*------Registrar celular----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarCelular` $$
create procedure `registrarCelular`(
	numero varchar(10),
    idUsuario int
) 
begin
	declare  identificacion int;
    set identificacion =  ObtenerIdPersona(idUsuario);
	insert into Celular (numero, estadoNumero, Persona_idPersona) values (numero, "Activo", identificacion);
END$$

/*------Registrar ubicacion----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarUbicacion` $$
create procedure `registrarUbicacion`(
	ubicacionPersona varchar(100),
    idUsuario int
) 
begin
	declare  identificacion int;
    set identificacion =  ObtenerIdPersona(idUsuario);
	insert into UbicacionPersona (Ubicacion, EstadoUbicacion, Persona_idPersona) values (ubicacionPersona, "Activo", identificacion);
END$$

/*------Registrar correo----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarCorreo` $$
create procedure `registrarCorreo`(
	correo varchar(100),
    idUsuario int
) 
begin
	declare  identificacion int;
    set identificacion =  ObtenerIdPersona(idUsuario);
	insert into CorreoPersona (correoPersona, estadoCorreo, Persona_idPersona) values (correo, "Activo", identificacion);
END$$    

/*------Registrar persona----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarPersona` $$
create procedure `registrarPersona`(
	identificacion int,
	nombre varchar(45),
    apellido varchar(45),
    edad int,
    tpDocumento varchar(45),
    telefono varchar(10),
    ubicacion varchar(100),
    correo varchar(100)
) 
begin
	insert into Persona (idPersona, nombrePersona, apellidoPersona, edadPersona, fk_idTipoDocumento) values (identificacion, nombre, apellido, edad, ObtenerIdTpDocumento(tpDocumento));
    call registrarCelular(telefono, identificacion);
    call registrarUbicacion(ubicacion, identificacion);
    call registrarCorreo(correo, identificacion);
END$$ 

/*---------------------------PROCEDIMIENTOS PARA Eliminar--------------------------------------*/

/*------Eliminar Celular----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `eliminarCelular` $$
create procedure `eliminarCelular`(
	IN numero varchar(45)
) 
begin
	delete from Celular where `idCelular` = ( select ObtenerIdCelular(numero));
END$$

/*------Eliminar Ubicacion----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `eliminarUbicacion` $$
create procedure `eliminarUbicacion`(
	IN documento int
) 
begin
	delete from UbicacionPersona where `idUbicacionPersona` = (select ObtenerIdUbicacion(documento));
END$$

/*------Eliminar Correo----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `eliminarCorreo` $$
create procedure `eliminarCorreo`(
	IN correo varchar(45)
) 
begin
	delete from CorreoPersona where `idCorreoPersona` = (select ObtenerIdCorreo(correo));
END$$

/*------Eliminar Persona----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `eliminarPersona` $$
create procedure `eliminarPersona`(
	IN documento int,
    celular varchar(12),
    correo varchar(45)
) 
begin
	call eliminarCelular(celular);
    call eliminarUbicacion(documento);
    call eliminarCorreo(correo);
	delete from Persona where `idPersona` = documento;
END$$

/*---------------------------PROCEDIMIENTOS PARA MOSTRAR--------------------------------------*/

/*------Mostrar Persona----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `mostrarPersona` $$
create procedure `mostrarPersona`() 
begin
	select P.*, Cel.numero as Telefono, Tpd.tipoDocumento as Tp_Documento, UP.Ubicacion as Ubicacion, CP.correoPersona as Correo 
    from Persona as P 
    inner join Celular as Cel on Cel.Persona_idPersona = P.idPersona
    inner join Tipo_Documento as Tpd on P.fk_idTipoDocumento = Tpd.idTipoDocumento
    inner join UbicacionPersona as UP on UP.Persona_idPersona = P.idPersona
    inner join CorreoPersona as CP on CP.Persona_idPersona = P.idPersona
    ;
END$$

/*---------------------------PROCEDIMIENTOS PARA Editar--------------------------------------*/

/*------Editar Celular----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `editarCeular` $$
create procedure `editarCeular`(
	IN documento int,
    nuevoNumero varchar(12),
    nuevoEstado varchar(20)
) 
begin
	update Celular set numero = nuevoNumero, estadoNumero = nuevoEstado
    where Persona_idPersona = documento;
END$$

/*------Editar Ubicacion----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `editarUbicacion` $$
create procedure `editarUbicacion`(
	IN documento int,
    nuevaUbicacion varchar(100),
    nuevoEstado varchar(20)
) 
begin
	update UbicacionPersona set Ubicacion = nuevaUbicacion, estadoUbicacion = nuevoEstado
    where Persona_idPersona = documento;
END$$

/*------Editar Correo----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `editarCorreo` $$
create procedure `editarCorreo`(
	IN documento int,
    nuevoCorreo varchar(40),
    nuevoEstado varchar(20)
) 
begin
	update CorreoPersona set correoPersona = nuevoCorreo, estadoCorreo = nuevoEstado
    where Persona_idPersona = documento;
END$$

/*------Editar Persona----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `editarPersona` $$
create procedure `editarPersona`(
	IN documento int,
    nombreModificado varchar(40),
    apellidoModificado varchar(40),
    edadModificada int,
    nuevoCelular varchar(12),
    nuevaUbicacion varchar(100),
    nuevoCorreo varchar(40)
) 
begin
	update Persona set nombrePersona = nombreModificado, apellidoPersona = apellidoModificado, edadPersona = edadModificada
    where idPersona = documento;
    call editarCeular(documento, nuevoCelular, "Activo");
    call editarUbicacion(documento, nuevaUbicacion, "Activa");
    call editarCorreo(documento, nuevoCorreo, "Activo");
END$$