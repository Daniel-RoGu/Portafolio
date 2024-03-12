use bdColegio;

/*------buscar id de tipoDocumento------*/
DELIMITER //
CREATE FUNCTION ObtenerIdTipoDocumento(nomTpDocumento Varchar(400))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT TipoDocumento.idTipoDocumento FROM TipoDocumento WHERE TipoDocumento.nombreTipoDocumento = nomTpDocumento LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar nombre de tipoDocumento------*/
DELIMITER //
CREATE FUNCTION ObtenerNombreTipoDocumento(idTpDocumento int)
RETURNS Varchar(400)  
READS SQL DATA
BEGIN
    DECLARE resultado varchar(400);
    SET resultado = (SELECT TipoDocumento.nombreTipoDocumento FROM TipoDocumento WHERE TipoDocumento.idTipoDocumento = idTpDocumento LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de tipoSangre------*/
DELIMITER //
CREATE FUNCTION ObtenerIdTipoSangre(nomTpSangre Varchar(400))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT TipoSangre.idTipoSangre FROM TipoSangre WHERE TipoSangre.nombreTipoSangre = nomTpSangre LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar nombre de tipoSangre------*/
DELIMITER //
CREATE FUNCTION ObtenerNombreTipoSangre(idTpSangre int)
RETURNS Varchar(400) 
READS SQL DATA
BEGIN
    DECLARE resultado varchar(400);
    SET resultado = (SELECT TipoSangre.nombreTipoSangre FROM TipoSangre WHERE TipoSangre.idTipoSangre = idTpSangre LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de Discapacidad------*/
DELIMITER //
CREATE FUNCTION ObtenerIdDiscapacidad (nomDiscapacidad Varchar(400))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT Discapacidad.idDiscapacidad FROM Discapacidad WHERE Discapacidad.nombreDiscapacidad = nomDiscapacidad LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar nombre de discapacidad------*/
DELIMITER //
CREATE FUNCTION ObtenerNombreDiscapacidad(idDiscapacidadEs int)
RETURNS Varchar(400) 
READS SQL DATA
BEGIN
    DECLARE resultado varchar(400);
    SET resultado = (SELECT Discapacidad.nombreDiscapacidad FROM Discapacidad WHERE Discapacidad.idDiscapacidad = idDiscapacidadEs LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de Rol------*/
DELIMITER //
CREATE FUNCTION ObtenerIdRol (nomRol Varchar(400))
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
CREATE FUNCTION ObtenerIdPermiso (nomPermiso Varchar(400))
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
CREATE FUNCTION ObtenerIdSisben (nomSisben Varchar(400))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT Sisben.idSisben FROM Sisben WHERE Sisben.nombreSisben = nomSisben LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar nombre de sisben------*/
DELIMITER //
CREATE FUNCTION ObtenerNombreSisben(idSisbenEs int)
RETURNS Varchar(400) 
READS SQL DATA
BEGIN
    DECLARE resultado varchar(400);
    SET resultado = (SELECT Sisben.nombreSisben FROM Sisben WHERE Sisben.idSisben = idSisbenEs LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de Estrato------*/
DELIMITER //
CREATE FUNCTION ObtenerIdEstrato (nomEstrato Varchar(400))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT Estrato.idEstrato FROM Estrato WHERE Estrato.nombreEstrato = nomEstrato LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar nombre de Estrato------*/
DELIMITER //
CREATE FUNCTION ObtenerNombreEstrato(idEstratoEs int)
RETURNS Varchar(400) 
READS SQL DATA
BEGIN
    DECLARE resultado varchar(400);
    SET resultado = (SELECT Estrato.nombreEstrato FROM Estrato WHERE Estrato.idEstrato = idEstratoEs LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de EPS------*/
DELIMITER //
CREATE FUNCTION ObtenerIdEPS (nomEPS Varchar(400))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT EPS.idEPS FROM EPS WHERE EPS.nombreEPS = nomEPS LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar nombre de EPS------*/
DELIMITER //
CREATE FUNCTION ObtenerNombreEPS(idEPSEs int)
RETURNS Varchar(400) 
READS SQL DATA
BEGIN
    DECLARE resultado varchar(400);
    SET resultado = (SELECT EPS.nombreEPS FROM EPS WHERE EPS.idEPS = idEPSEs LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de Genero------*/
DELIMITER //
CREATE FUNCTION ObtenerIdGenero (nomGenero Varchar(400))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT Genero.idGenero FROM Genero WHERE Genero.nombreGenero = nomGenero LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar nombre de genero------*/
DELIMITER //
CREATE FUNCTION ObtenerNombreGenero(idGeneroEs int)
RETURNS Varchar(400)  
READS SQL DATA
BEGIN
    DECLARE resultado varchar(400);
    SET resultado = (SELECT Genero.nombreGenero FROM Genero WHERE Genero.idGenero = idGeneroEs LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de ModalidadEducativa------*/
DELIMITER //
CREATE FUNCTION ObtenerIdModalidadEducativa(nomModalidad Varchar(400))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT ModalidadEducativa.idModalida_Educativa FROM Modalida_Educativa as ModalidadEducativa WHERE ModalidadEducativa.nombreModalidad = nomModalidad LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de Usuario------*/
DELIMITER //
CREATE FUNCTION ObtenerIdUsuario(documento bigint)
RETURNS bigint 
READS SQL DATA
BEGIN
    DECLARE resultado bigint;
    SET resultado = (SELECT Usuario.identificacion FROM Usuario WHERE Usuario.identificacion = documento LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de Sede-----*/
DELIMITER //
CREATE FUNCTION ObtenerIdSede(nomSede Varchar(400))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT Sede.idSede FROM Sede WHERE Sede.nombreSede = nomSede LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar nombre de Sede-----*/
DELIMITER //
CREATE FUNCTION ObtenerNombreSede(idSedeRef Varchar(400))
RETURNS Varchar(400) 
READS SQL DATA
BEGIN
    DECLARE resultado Varchar(400);
    SET resultado = (SELECT Sede.nombreSede FROM Sede WHERE Sede.idSede = idSedeRef LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de Estudiante-----*/
DELIMITER //
CREATE FUNCTION ObtenerIdEstudiante(identificacion long)
RETURNS long 
READS SQL DATA
BEGIN
    DECLARE resultado long;
    SET resultado = (SELECT Estudiante.idEstudiante FROM Estudiante WHERE Estudiante.Usuario_identificacion = identificacion LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar documento de Estudiante-----*/
DELIMITER //
CREATE FUNCTION ObtenerDocEstudiante(identificacion long)
RETURNS long 
READS SQL DATA
BEGIN
    DECLARE resultado long;
    SET resultado = (SELECT Estudiante.Usuario_identificacion FROM Estudiante WHERE Estudiante.Usuario_identificacion = identificacion LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar codigo de Estudiante-----*/
DELIMITER //
CREATE FUNCTION ObtenerCodigoEstudiante(identificacion long)
RETURNS long
READS SQL DATA
BEGIN
    DECLARE resultado long;
    SET resultado = (SELECT Estudiante.codigoEstudiante FROM Estudiante WHERE Estudiante.Usuario_identificacion = identificacion LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de Funcionario-----*/
DELIMITER //
CREATE FUNCTION ObtenerIdFuncionario(identificacion long)
RETURNS long
READS SQL DATA
BEGIN
    DECLARE resultado long;
    SET resultado = (SELECT Funcionario.idFuncionario FROM Funcionario WHERE Funcionario.Usuario_identificacion = identificacion LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de Grado-----*/
DELIMITER //
CREATE FUNCTION ObtenerIdGrado(nomGrado Varchar(400))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT Grados.idGrado FROM Grados WHERE Grados.nombreGrado = nomGrado LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de GradoGrupo-----*/
DELIMITER //
CREATE FUNCTION ObtenerIdGradoGrupo(nomGradoGrupo Varchar(400))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT GradoGrupo.idGradoGrupo FROM GradoGrupo WHERE GradoGrupo.grupoGrado = nomGradoGrupo LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de Docente-----*/
DELIMITER //
CREATE FUNCTION ObtenerIdDocente(identificacionDocente long)
RETURNS int
READS SQL DATA
BEGIN
    DECLARE resultado int;
    SET resultado = (SELECT Docente.idDocente FROM Docente WHERE Docente.fkidentificacion = identificacionDocente LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de Asignatura-----*/
DELIMITER //
CREATE FUNCTION ObtenerIdAsignatura(nomAsignatura varchar(400))
RETURNS int
READS SQL DATA
BEGIN
    DECLARE resultado int;
    SET resultado = (SELECT Asignatura.idAsignatura FROM Asignatura WHERE Asignatura.nombreAsignatura = nomAsignatura LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar id de Existe Grado retorno-----*/
DELIMITER $$
CREATE FUNCTION existeGradoRetorno(nomGrado varchar(400))
RETURNS int
READS SQL DATA 
begin
	DECLARE resultado int;
    SET resultado = (SELECT COUNT(*) > 0 AS existe_valor
	FROM Grados as g
	WHERE g.nombreGrado = nomGrado);
    RETURN resultado;
END$$