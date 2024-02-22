use bdColegio;

/*modificador de tabla para usar formato de texto utf8mb4*/
ALTER TABLE Usuario CONVERT TO CHARACTER SET utf8mb4;

/*--------------------------Registrar TipoSangre-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarTipoSangre` $$
create procedure `registrarTipoSangre`(
    nomTpSangre varchar(400)
) 
begin
	insert into TipoSangre (nombreTipoSangre, estadoTipoSangre)
				value(nomTpSangre, "Activo");
END$$

/*--------------------------Registrar TipoDocumento-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarTipoDocumento` $$
create procedure `registrarTipoDocumento`(
    nomTpDocumento varchar(400)
) 
begin
	insert into TipoDocumento (nombreTipoDocumento, estadoTipoDocumento)
				value(nomTpDocumento, "Activo");
END$$

/*--------------------------Registrar Discapacidad-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarDiscapacidad` $$
create procedure `registrarDiscapacidad`(
    nomDiscapacidad	 varchar(400)
) 
begin
	insert into Discapacidad (nombreDiscapacidad, estadoDiscapacidad)
				value(nomDiscapacidad, "Activo");
END$$

/*--------------------------Registrar Genero-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarGenero` $$
create procedure `registrarGenero`(
    nomGenero varchar(400)
) 
begin
	insert into Genero (nombreGenero, estadoGenero)
				value(nomGenero, "Activo");
END$$

/*--------------------------Registrar EPS-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarEPS` $$
create procedure `registrarEPS`(
    nomEPS varchar(400)
) 
begin
	insert into EPS (nombreEPS, estadoEPS)
				value(nomEPS, "Activo");
END$$

/*--------------------------Registrar Estrato-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarEstrato` $$
create procedure `registrarEstrato`(
    nomEstrato varchar(400)
) 
begin
	insert into Estrato (nombreEstrato, estadoEstrato)
				value(nomEstrato, "Activo");
END$$

/*--------------------------Registrar Rol-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarRol` $$
create procedure `registrarRol`(
    nomRol varchar(400)
) 
begin
	insert into Rol (nombreRol, estadoRol)
				value(nomRol, "Activo");
END$$

/*--------------------------Registrar Permiso-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarPermiso` $$
create procedure `registrarPermiso`(
    nomPermiso varchar(400)
) 
begin
	insert into Permiso (nombrePermiso, estadoPermiso)
				value(nomPermiso, "Activo");
END$$

/*--------------------------Registrar RolPermiso-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarRolPermiso` $$
create procedure `registrarRolPermiso`(
    nombreInterfaz varchar(400),
    nombreCarpetaRaiz varchar(400),
    nombreRol varchar(400),
    nombrePermiso varchar(400)
) 
begin
	insert into RolPermiso (nombreVista, vistaRaiz, fkidRol, fkidPermiso)
				value(nombreInterfaz, nombreCarpetaRaiz, (select ObtenerIdRol(nombreRol)), (select ObtenerIdPermiso(nombrePermiso)));
END$$

/*--------------------------Registrar Sisben-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarSisben` $$
create procedure `registrarSisben`(
    nomSisben varchar(400)
) 
begin
	insert into Sisben (nombreSisben, estadoSisben)
				value(nomSisben, "Activo");
END$$

/*--------------------------Registrar Usuario-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarUsuario` $$
create procedure `registrarUsuario`(
	documento BIGINT,
	nomUsuario varchar(400),
    nom2Usuario varchar(400),
    apellidoUsuario varchar(400),
    apellido2Usuario varchar(400),
    edad int,
    telCelular varchar(400),
    telFijo varchar(400),
    correoUss varchar(400),
    direccionUss varchar(400),
    barrioUss varchar(400),
    fechaNacimientoUss varchar(400),
    tipoSangre varchar(400),
    tipoDocumento varchar(400),
    nombreDiscapacidad varchar(400),
    nombreSisben varchar(400),
    nombreGenero varchar(400),
    nombreEps varchar(400),
    nombreEstrato varchar(400),
    nombreRol varchar(400)
) 
begin
	insert into Usuario (identificacion, primerNombreUsuario, segundoNombreUsuario, primerApellidoUsuario, segundoApellidoUsuario, edadUsuario,
						   telefonoCelular, telefonoFijo, correo, direccion, barrioUbicacionUsuario, fechaNacimiento, estadoUsuario, fkidTipoDocumento,
                           fkidTipoSangre, fkidDiscapacidad, fkidSisben, fkidRol, fkidEstrato, fkidEPS, fkidGenero)
				value(documento, nomUsuario, nom2Usuario, apellidoUsuario, apellido2Usuario, edad, telCelular, telFijo, correoUss,
					   direccionUss, barrioUss, fechaNacimientoUss, "Activo", (select ObtenerIdTipoDocumento(tipoDocumento)), (select ObtenerIdTipoSangre(tipoSangre)), 
					   (select ObtenerIdDiscapacidad(nombreDiscapacidad)), (select ObtenerIdSisben(nombreSisben)), (select ObtenerIdRol(nombreRol)), (select ObtenerIdEstrato(nombreEstrato)), 
                       (select ObtenerIdEPS(nombreEps)), (select ObtenerIdGenero(nombreGenero)));
END$$

/*--------------------------Validar existencia de EPS-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeEPS` $$
create procedure `existeEPS`(nomEps varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM EPS as eps
	WHERE eps.nombreEPS = nomEps;
END$$

/*--------------------------Validar existencia tipo de sangre-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeTpSangre` $$
create procedure `existeTpSangre`(nomTpSangre varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM tipoSangre as tpSangre
	WHERE tpSangre.nombreTipoSangre = nomTpSangre;
END$$

/*--------------------------Validar existencia tipo de documento-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeTpDocumento` $$
create procedure `existeTpDocumento`(nomTpDocumento varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM tipoDocumento as tpDoc
	WHERE tpDoc.nombreTipoDocumento = nomTpDocumento;
END$$

/*--------------------------Validar existencia discapacidad-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeDiscapacidad` $$
create procedure `existeDiscapacidad`(nomDiscapacidad varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM Discapacidad as dis
	WHERE dis.nombreDiscapacidad = nomDiscapacidad;
END$$

/*--------------------------Validar existencia Genero-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeGenero` $$
create procedure `existeGenero`(nomGenero varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM Genero as gen
	WHERE gen.nombreGenero = nomGenero;
END$$

/*--------------------------Validar existencia Sisven-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeSisben` $$
create procedure `existeSisben`(nomSisben varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM Sisben as Sb
	WHERE Sb.nombreSisben = nomSisben;
END$$

/*--------------------------Validar existencia Usuario Login-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeUsuarioLogin` $$
create procedure `existeUsuarioLogin`(idUsuario varchar(400), passUsuario varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM Usuario as us
	WHERE us.identificacion = (SELECT CAST(idUsuario AS SIGNED)) and
		  us.identificacion = (SELECT CAST(passUsuario AS SIGNED));
END$$


