USE `adopciones`;

/*---------------------------FUNCIONES PARA BUSCAR----------------------------------------*/

/*------buscar id de una persona------*/
DELIMITER //
CREATE FUNCTION ObtenerIdPersona(identificacion INT)
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT idPersona FROM Persona WHERE idPersona = identificacion LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de un rol por su nombre------*/
DELIMITER //
CREATE FUNCTION ObtenerIdRol(rol varchar(50))
RETURNS INT
READS SQL DATA 
BEGIN
    DECLARE resultado int;
    SET resultado = (select Roles.idRol from Roles where Roles.nombreRol = rol LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de un permiso por su nombre------*/
DELIMITER //
CREATE FUNCTION ObtenerIdPermiso(permiso varchar(50))
RETURNS INT
READS SQL DATA 
BEGIN
    DECLARE resultado int;
    SET resultado = (select Permisos.idPermisos from Permisos where Permisos.nombrePermiso = permiso LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de un Tipo Documento por su nombre------*/
DELIMITER //
CREATE FUNCTION ObtenerIdTpDocumento(tpDocumento varchar(50))
RETURNS INT
READS SQL DATA 
BEGIN
    DECLARE resultado int;
    SET resultado = (select Tipo_Documento.idTipoDocumento from Tipo_Documento where Tipo_Documento.tipoDocumento = tpDocumento LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de celular------*/
DELIMITER //
CREATE FUNCTION ObtenerIdCelular(numeroC varchar(12))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT idCelular FROM Celular WHERE numero = numeroC LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

select ObtenerIdCelular("310254964");

/*------buscar id Ubicacion------*/
DELIMITER //
CREATE FUNCTION ObtenerIdUbicacion(documento INT)
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT idUbicacionPersona FROM UbicacionPersona WHERE Persona_idPersona = documento LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

select ObtenerIdUbicacion(456123);

/*------buscar id de Correo------*/
DELIMITER //
CREATE FUNCTION ObtenerIdCorreo(correo varchar(40))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT idCorreoPersona FROM CorreoPersona WHERE correoPersona = correo LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

select ObtenerIdCorreo("el@diceqNo.com");

/*------buscar id de un Usuario por su nombre------*/
DELIMITER //
CREATE FUNCTION ObtenerIdUsuario(usuarioN varchar(50))
RETURNS INT
READS SQL DATA 
BEGIN
    DECLARE resultado int;
    SET resultado = (select Usuario.idUsuario from Usuario where Usuario.nombreUsuario = usuarioN LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de un Mascota por su nombre------*/
DELIMITER //
CREATE FUNCTION ObtenerIdMascota(nombreM varchar(50))
RETURNS INT
READS SQL DATA 
BEGIN
    DECLARE resultado int;
    SET resultado = (select Mascota.idMascota from Mascota where Mascota.nombreMascota = nombreM LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de un Vacuna por su nombre------*/
DELIMITER //
CREATE FUNCTION ObtenerIdVacuna(nombreV varchar(50))
RETURNS INT
READS SQL DATA 
BEGIN
    DECLARE resultado int;
    SET resultado = (select Vacunas.idVacunas from Vacunas where Vacunas.nombreVacuna = nombreV LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de un Raza por su nombre------*/
DELIMITER //
CREATE FUNCTION ObtenerIdRaza(nombreR varchar(50))
RETURNS INT
READS SQL DATA 
BEGIN
    DECLARE resultado int;
    SET resultado = (select Raza.idRaza from Raza where Raza.nombreRaza = nombreR LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de un Tipo Mascota por su nombre------*/
DELIMITER //
CREATE FUNCTION ObtenerIdTpMascota(nombreTpM varchar(50))
RETURNS INT
READS SQL DATA 
BEGIN
    DECLARE resultado int;
    SET resultado = (select Tipo_Mascota.idTipoMascota from Tipo_Mascota where Tipo_Mascota.tipoMascota = nombreTpM LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*----------Concatenar Vacunas por Mascota----------*/
DELIMITER //
CREATE FUNCTION ConcatenarVacunasMascota(nombreM varchar(50))
RETURNS Varchar(200)
READS SQL DATA 
BEGIN
    DECLARE resultado varchar(200);
    SET resultado = (select GROUP_CONCAT(v.nombreVacuna SEPARATOR ', ') as Vacunas_Mascota from Mascota_Vacunas as mv
					  inner join Vacunas as v on mv.fk_idVacunas = v.idVacunas
                      inner join Mascota as m on mv.fk_idMascota = m.idMascota);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de un Adopcion por id de mascota------*/
DELIMITER //
CREATE FUNCTION ObtenerIdAdopcionMascota(nombreM varchar(50))
RETURNS INT
READS SQL DATA 
BEGIN
    DECLARE resultado int;
    SET resultado = (select idAdopcion from Adopcion where fk_idMascota = (select ObtenerIdMascota(nombreM)) LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;