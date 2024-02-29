use bdColegio;

/*--------------------------Validar Registro TipoSangre-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `validarTipoSangre` $$
create procedure `validarTipoSangre`(
    nomTpSangre varchar(45)
) 
begin
	select exists(select TipoSangre.nombreTipoSangre from TipoSangre where TipoSangre.nombreTipoSangre = nomTpSangre) as Resultado;
END$$

call validarTipoSangre("O+");

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

/*--------------------------Validar existencia de Estudiante-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeEstudiante` $$
create procedure `existeEstudiante`(identificacionUs long) 
begin
	/*select if(est.Usuario_identificacion = identificacionUs, true, false)
    from Estudiante as est;*/
    SELECT COUNT(*) > 0 AS existe_valor
	FROM Estudiante as est
	WHERE est.Usuario_identificacion = identificacionUs;
END$$

/*--------------------------Validar existencia Sede-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeSede` $$
create procedure `existeSede`(nomSede varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM Sede as s
	WHERE s.nombreSede = nomSede;
END$$

/*--------------------------Validar existencia Grado-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeGrado` $$
create procedure `existeGrado`(nomGrado varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM Grados as g
	WHERE g.nombreGrado = nomGrado;
END$$

/*--------------------------Validar existencia Grupo Grado-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeGrupoGrado` $$
create procedure `existeGrupoGrado`(nomGradoGrupo varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM GradoGrupo as gg
	WHERE gg.grupoGrado = nomGradoGrupo;
END$$


/*--------------------------Validar existencia Sede Grado-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeSedeGrado` $$
create procedure `existeSedeGrado`(nomSede varchar(400), nomGrado varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM SedeGrados as sg
	WHERE sg.fkidSede = (select ObtenerIdSede(nomSede)) and sg.fkidGrado = (select ObtenerIdGrado(nomGrado));
END$$

/*--------------------------Validar existencia Estudiante Grupo Grado-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeEstudianteGrupoGrado` $$
create procedure `existeEstudianteGrupoGrado`(identificacionEst varchar(400), grupoGrado varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM EstudiantesGradoGrupo as egg
	WHERE egg.fkidEstudiante = (select ObtenerIdEstudiante(CAST(identificacionEst AS SIGNED))) and egg.fkidGradoGrupo = (select ObtenerIdGradoGrupo(grupoGrado));
END$$


/*--------------------------Validar existencia Matricula-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeMatricula` $$
create procedure `existeMatricula`(identificacionEst varchar(400), identificacionFuncionario varchar(400), nomSede varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM Matricula as m
	WHERE m.fkidEstudiante = (select ObtenerIdEstudiante(CAST(identificacionEst AS SIGNED))) and 
		  m.fkidFuncionario = (select ObtenerIdFuncionario((SELECT CAST(identificacionFuncionario AS SIGNED)))) and
          m.fkidSede = (select ObtenerIdSede(nomSede));
END$$

/*--------------------------Validar existencia Modalidad-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeModalidad` $$
create procedure `existeModalidad`(nomModalidad varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM modalida_educativa as m
	WHERE m.nombreModalidad = nomModalidad;
END$$

/*--------------------------Validar existencia Competencias-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeCompetencia` $$
create procedure `existeCompetencia`(nomCompetencia varchar(400), nomAsignatura varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM Competencias as c
	WHERE c.nombreCompetencia = nomCompetencia
		  and c.fkidAsignatura = (select ObtenerIdAsignatura(nomAsignatura));
END$$

/*--------------------------Validar existencia Asignatura en Grupo Grado-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeAsignaturaGradoGrupo` $$
create procedure `existeAsignaturaGradoGrupo`(nomAsignatura varchar(400), grupoGrado varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM asignaturaGradoGrupo as agg
	WHERE agg.fkidGradoGrupo = (select ObtenerIdGradoGrupo(grupoGrado))
		  and agg.fkidAsignatura = (select ObtenerIdAsignatura(nomAsignatura));
END$$

/*--------------------------Validar existencia Docente-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeDocente` $$
create procedure `existeDocente`(identificacionDocente varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM Docente as d
	WHERE d.fkidentificacion = (select ObtenerIdDocente((select CAST(identificacionDocente AS SIGNED))));
END$$

/*--------------------------Validar existencia Docente Grado-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeDocenteGrado` $$
create procedure `existeDocenteGrado`(nombreDocente varchar(400), nomGrupo varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM DocentesGrado as dg
	WHERE dg.fkidDocente = (SELECT d.idDocente FROM docente AS d
								 INNER JOIN usuario AS u ON CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
																   COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, '')) COLLATE utf8mb4_unicode_ci = nombreDocente
								 WHERE d.fkidentificacion = u.identificacion) 
		  and dg.fkidGrado = (select g.idGrado from gradogrupo as gg 
							   inner join Grados as g on gg.fkidGrado = g.idGrado
                               where gg.grupoGrado = nomGrupo);
END$$

/*--------------------------Validar existencia Docente Asignatura-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeDocenteAsignatura` $$
create procedure `existeDocenteAsignatura`(nombreDocente varchar(400), nomAsignatura varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM DocenteAsignatura as da
	WHERE da.fkidDocente = (SELECT d.idDocente FROM docente AS d
								 INNER JOIN usuario AS u ON CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
																   COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, '')) COLLATE utf8mb4_unicode_ci = nombreDocente
								 WHERE d.fkidentificacion = u.identificacion) 
		  and da.fkidAsignatura = (select ObtenerIdAsignatura(nomAsignatura)) ;
END$$

/*--------------------------Validar existencia Docente-Asignatura-Grupo-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeDocenteAsignaturaGrupo` $$
create procedure `existeDocenteAsignaturaGrupo`(nombreDocente varchar(400), nomAsignatura varchar(400), nomGrupo varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM Docente as d
    inner join docentesGrado as dg on dg.fkidDocente = d.idDocente
    inner join docenteAsignatura as da on da.fkidDocente = d.idDocente
    inner join asignatura as a on da.fkidAsignatura = a.idAsignatura
    inner join asignaturaGradoGrupo as agg on agg.fkidAsignatura = a.idAsignatura
	WHERE d.idDocente = (SELECT d.idDocente FROM docente AS d
								 INNER JOIN usuario AS u ON CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
																   COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, '')) COLLATE utf8mb4_unicode_ci = nombreDocente
								 WHERE d.fkidentificacion = u.identificacion) 
		  and a.idAsignatura = (select ObtenerIdAsignatura(nomAsignatura)) 
          and (select g.idGrado from gradogrupo as gg 
			   inner join Grados as g on gg.fkidGrado = g.idGrado
               where gg.idGradoGrupo = agg.fkidGradoGrupo) = dg.fkidGrado;
END$$
