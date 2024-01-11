use bd_colegio;

/*------buscar id de tipoDocumento------*/
DELIMITER //
CREATE FUNCTION ObtenerIdTipoDocumento(nomTpDocumento Varchar(200))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT TipoDocumento.idTipoDocumento FROM TipoDocumento WHERE TipoDocumento.nombreTipoDocumento = nomTpDocumento LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de tipoSangre------*/
DELIMITER //
CREATE FUNCTION ObtenerIdTipoSangre(nomTpSangre Varchar(200))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT TipoSangre.idTipoSangre FROM TipoSangre WHERE TipoSangre.nombreTipoSangre = nomTpSangre LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de Discapacidad------*/
DELIMITER //
CREATE FUNCTION ObtenerIdDiscapacidad (nomDiscapacidad Varchar(60))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT Discapacidad.idDiscapacidad FROM Discapacidad WHERE Discapacidad.nombreDiscapacidad = nomDiscapacidad LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de Rol------*/
DELIMITER //
CREATE FUNCTION ObtenerIdRol (nomRol Varchar(60))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT Rol.idRol FROM Rol WHERE Rol.nombreRol = nomRol LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de Permiso------*/
DELIMITER //
CREATE FUNCTION ObtenerIdPermiso (nomPermiso Varchar(60))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT Permiso.idPermiso FROM Permiso WHERE Permiso.nombrePermiso = nomPermiso LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de Sisben------*/
DELIMITER //
CREATE FUNCTION ObtenerIdSisben (nomSisben Varchar(60))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT Sisben.idSisben FROM Sisben WHERE Sisben.nombreSisben = nomSisben LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de Estrato------*/
DELIMITER //
CREATE FUNCTION ObtenerIdEstrato (nomEstrato Varchar(60))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT Estrato.idEstrato FROM Estrato WHERE Estrato.nombreEstrato = nomEstrato LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de EPS------*/
DELIMITER //
CREATE FUNCTION ObtenerIdEPS (nomEPS Varchar(60))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT EPS.idEPS FROM EPS WHERE EPS.nombreEPS = nomEPS LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de Genero------*/
DELIMITER //
CREATE FUNCTION ObtenerIdGenero (nomGenero Varchar(60))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT Genero.idGenero FROM Genero WHERE Genero.nombreGenero = nomGenero LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de ModalidadEducativa------*/
DELIMITER //
CREATE FUNCTION ObtenerIdModalidadEducativa(nomModalidad Varchar(200))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT ModalidadEducativa.idModalidad_Educativa FROM ModalidadEducativa WHERE ModalidadEducativa.nombreModalidad = nomModalidad LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de Usuario------*/
DELIMITER //
CREATE FUNCTION ObtenerIdUsuario(documento int)
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT Usuario.identificacion FROM Usuario WHERE Usuario.identificacion = documento LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de Sede-----*/
DELIMITER //
CREATE FUNCTION ObtenerIdSede(nomSede Varchar(60))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT Sede.idSede FROM Sede WHERE Sede.nombreSede = nomSede LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;