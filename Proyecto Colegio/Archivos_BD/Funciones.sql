/*-------orden de ejecucion de scripts ---------- Script Nº2*/
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

/*------buscar nombre de Estudiante-----*/
DELIMITER //
CREATE FUNCTION ObtenerNombreEstudiante(idEstudianteRef bigint)
RETURNS Varchar(400) 
READS SQL DATA
BEGIN
    DECLARE resultado Varchar(400);
    SET resultado = (SELECT (CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), ' ', 
						 COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, '')))
						 FROM Estudiante AS e
						 INNER JOIN Usuario AS u ON e.Usuario_identificacion = u.identificacion
						 WHERE e.idEstudiante = idEstudianteRef LIMIT 1);
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

/*------buscar id del Grado del grupo-----*/
DELIMITER //
CREATE FUNCTION ObtenerIdGradoDelGrupo(nomGrupo Varchar(400))
RETURNS INT 
READS SQL DATA
BEGIN
    DECLARE resultado INT;
    SET resultado = (SELECT g.idGrado FROM GradoGrupo as gg
				     inner join Grados as g on gg.fkidGrado = g.idGrado
                     WHERE gg.grupoGrado = nomGrupo LIMIT 1);
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

/*------buscar nombre de Docente-----*/
DELIMITER //
CREATE FUNCTION ObtenerNombreCompletoDocente(identificacionDocente long)
RETURNS varchar(400)
READS SQL DATA
BEGIN
    DECLARE resultado varchar(400);
    SET resultado = (SELECT (CONCAT(COALESCE(u.primerNombreUsuario, ''), CASE WHEN u.segundoNombreUsuario IS NOT NULL THEN ' ' ELSE '' END, 
							COALESCE(u.segundoNombreUsuario, ''), ' ', COALESCE(u.primerApellidoUsuario, ''), ' ', 
							COALESCE(u.segundoApellidoUsuario, '')
					)) as Docente
					From Usuario as u
					inner join Docente as d on d.fkidentificacion = u.identificacion
					where u.identificacion = identificacionDocente);
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
    SET resultado = (SELECT Asignatura.idAsignatura FROM Asignatura 
					 WHERE Asignatura.nombreAsignatura = nomAsignatura 
                     ORDER BY Asignatura.idAsignatura DESC LIMIT 1);
    RETURN resultado;
END;
//
DELIMITER ;

/*------buscar nombre de Asignatura-----*/
DELIMITER //
CREATE FUNCTION ObtenerNombreAsignatura(idAsignaturaRef varchar(400))
RETURNS varchar(400)
READS SQL DATA
BEGIN
    DECLARE resultado varchar(400);
    SET resultado = (SELECT Asignatura.nombreAsignatura FROM Asignatura WHERE Asignatura.idAsignatura = idAsignaturaRef LIMIT 1);
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

/*------buscar id de Existe Grupo retorno-----*/
DELIMITER $$
CREATE FUNCTION existeGrupoRetorno(nomGrupo varchar(400))
RETURNS int
READS SQL DATA 
begin
	DECLARE resultado int;
    SET resultado = (SELECT COUNT(*) > 0 AS existe_valor
	FROM GradoGrupo as gg
	WHERE gg.grupoGrado = nomGrupo);
    RETURN resultado;
END$$

/*------buscar existencia Docente Horario-----*/
DELIMITER $$
CREATE FUNCTION existeDocenteHorario(idDocenteRef varchar(400), rangoHorario varchar(400), diaHorario varchar(400))
RETURNS int
READS SQL DATA 
begin
	DECLARE resultado int;
    SET resultado = (SELECT COUNT(*) > 0 AS existe_valor
	FROM horarioDocente as hA
	WHERE hA.fkidDocente = idDocenteRef AND hA.fkidHorario = (select ObtenerIdHorario(rangoHorario, diaHorario)));
    RETURN resultado;
END$$

/*--------------------------buscar existencia Grupo Horario-------------------------*/
DELIMITER $$
CREATE FUNCTION existeGrupoHorario(nomGrupo varchar(400), rangoHorario varchar(400), diaHorario varchar(400))
RETURNS int
READS SQL DATA 
begin
	DECLARE resultado int;
    SET resultado = (SELECT COUNT(*) > 0 AS existe_valor
	FROM horarioGradoGrupo AS hgg
	WHERE hgg.fkidGradoGrupo = (select ObtenerIdGradoGrupo(nomGrupo)) AND hgg.fkidHorario = (select ObtenerIdHorario(rangoHorario, diaHorario)));
    RETURN resultado;
END$$

/*--------------------------buscar existencia Asignatura Horario-------------------------*/
DELIMITER $$
CREATE FUNCTION existeAsignaturaHorario(nomAsignatura varchar(400), rangoHorario varchar(400), diaHorario varchar(400))
RETURNS int
READS SQL DATA 
begin
	DECLARE resultado int;
    SET resultado = (SELECT COUNT(*) > 0 AS existe_valor
	FROM horarioAsignatura AS ha
	WHERE ha.fkidAsignatura = (select ObtenerIdAsignatura(nomAsignatura)) AND ha.fkidHorario = (select ObtenerIdHorario(rangoHorario, diaHorario)));
    RETURN resultado;
END$$

/*--------------------------buscar existencia Titular Grupo-------------------------*/
DELIMITER $$
CREATE FUNCTION existeTitularGrupo(grupoRef varchar(400))
RETURNS int
READS SQL DATA 
begin
	DECLARE resultado int;
    SET resultado = (SELECT COUNT(*) > 0 AS existe_valor
	FROM GradoGrupo AS gg
	WHERE gg.grupoGrado = grupoRef);
    RETURN resultado;
END$$

DELIMITER $$
CREATE FUNCTION esTitularGrupo(nombreDocente varchar(400), grupoRef varchar(400))
RETURNS int
READS SQL DATA 
begin
	DECLARE resultado int;
    SET resultado = (SELECT COUNT(*) > 0 AS existe_valor
	FROM GradoGrupo AS gg
	WHERE gg.grupoGrado = grupoRef and gg.nombreTitular = nombreDocente);
    RETURN resultado;
END$$

/*--------------------------buscar existencia Horario-------------------------*/
DELIMITER $$
CREATE FUNCTION existeHorario(rangoHorario varchar(400), diaHorario varchar(400))
RETURNS int
READS SQL DATA 
begin
	DECLARE horaInicioClase VARCHAR(400);
    DECLARE horaFinClase VARCHAR(400);
	DECLARE resultado int;
    
    SET horaInicioClase = LEFT(SUBSTRING_INDEX(rangoHorario, '-', 1), 5); /*En (06:00-07:00) obtiene la primera hora*/
    SET horaFinClase = RIGHT(SUBSTRING_INDEX(rangoHorario, '-', -1), 5); /*En (06:00-07:00) obtiene la segunda hora*/
    
    SET resultado = (SELECT COUNT(*) > 0 AS existe_valor
	FROM Horario AS h
	WHERE h.horaInicio = horaInicioClase AND h.horaFin = horaFinClase AND h.diaHorario = diaHorario);
    RETURN resultado;
END$$

/*------buscar id de Existe Familiar Estudiante-----*/
DELIMITER $$
CREATE FUNCTION FunexisteFamiliarEstudiante(identificacionFamiliar long)
RETURNS int
READS SQL DATA 
begin	
	DECLARE resultado int;
    SET resultado = (SELECT COUNT(*) > 0 AS existe_valor
	FROM Familiar as f
	WHERE f.identificacionFamiliar = identificacionFamiliar);
    RETURN resultado;
END$$

/*------buscar id de Existe Docente Grado y Asignatura-----*/
DELIMITER $$
CREATE FUNCTION FunExisteDocenteAsignaturaGrado(idDocenteRef int, nomAsignatura varchar(400), idGradoR int)
RETURNS int
READS SQL DATA 
begin
	DECLARE resultado int;
	DECLARE idAsignaturaRef INT;
    DECLARE idGradoRef INT;
    
    SET idAsignaturaRef = (SELECT a.idAsignatura FROM Asignatura as a
						   WHERE a.nombreAsignatura = nomAsignatura);
    SET idGradoRef = (SELECT g.idGrado FROM Grados as g 
				      WHERE g.idGrado = idGradoR);
	
    SET resultado = (SELECT COUNT(*) > 0 AS existe_valor
					FROM Docente AS d
					INNER JOIN DocenteAsignatura AS da ON da.fkidDocente = d.idDocente AND da.fkidAsignatura = idAsignaturaRef
					LEFT JOIN DocentesGrado AS dg ON dg.fkidDocente = d.idDocente AND dg.fkidGrado = idGradoRef
					WHERE d.idDocente = idDocenteRef);
    
    RETURN resultado;
END$$

/*------buscar si Existe Registro Nota Final-----*/
DELIMITER $$
CREATE FUNCTION FunexisteNotaFinal()
RETURNS int
READS SQL DATA 
begin	
	DECLARE resultado int;
    SET resultado = (SELECT COUNT(*) > 0 AS existe_valor
	FROM NotaFinal);
    RETURN resultado;
END$$

/*------buscar id de Existe Nota Definitiva Periodo-----*/
DELIMITER $$
CREATE FUNCTION FunexisteNotaDefinitivaPeriodo(periodoRef varchar(400), asignaturaRef varchar(400))
RETURNS int
READS SQL DATA 
begin	
	DECLARE resultado int;
    SET resultado = (SELECT COUNT(*) > 0 AS existe_valor
	FROM NotaDefinitivaPeriodo as ndp
	WHERE ndp.fkidPeriodoAcademico = (select ObtenerIdPeriodo(periodoRef))
    and ndp.fkidAsignatura = (select ObtenerIdAsignatura(asignaturaRef))
    );
    RETURN resultado;
END$$

/*------buscar id de Existe Periodo-----*/
DELIMITER $$
CREATE FUNCTION FunexistePeriodo(periodoRef varchar(400))
RETURNS int
READS SQL DATA 
begin	
	DECLARE resultado int;
    SET resultado = (SELECT COUNT(*) > 0 AS existe_valor
	FROM PeriodoAcademico as p
	WHERE p.periodoAcademico = periodoRef);
    RETURN resultado;
END$$

/*------buscar id de Existe Puesto Estudiante-----*/
DELIMITER $$
CREATE FUNCTION FunexistePuestoEstudiantePeriodo(idEstudiante long)
RETURNS int
READS SQL DATA 
begin	
	DECLARE resultado int;
    SET resultado = (SELECT COUNT(*) > 0 AS existe_valor
	FROM PuestosGrupo as pg
	WHERE pg.idEstudianteGrupo = idEstudiante);
    RETURN resultado;
END$$

/*------Obtener ID Horario por rango_horario-----*/
DELIMITER $$
CREATE FUNCTION ObtenerIdHorario(rangoHorario VARCHAR(400),  diaHorarioClase VARCHAR(400))
RETURNS int
READS SQL DATA 
begin
	DECLARE resultado int;
    DECLARE horaInicioClase VARCHAR(400);
    DECLARE horaFinClase VARCHAR(400);
    
    SET horaInicioClase = LEFT(SUBSTRING_INDEX(rangoHorario, '-', 1), 5); /*En (06:00-07:00) obtiene la primera hora*/
    SET horaFinClase = RIGHT(SUBSTRING_INDEX(rangoHorario, '-', -1), 5); /*En (06:00-07:00) obtiene la segunda hora*/
    
    SET resultado = (SELECT h.idHorario FROM Horario as h
					 WHERE h.horaInicio = horaInicioClase and h.horaFin = horaFinClase and h.diaHorario = diaHorarioClase);
    
    RETURN resultado;
END$$

/*------obtener id Periodo-----*/
DELIMITER $$
CREATE FUNCTION obtenerIdPeriodo(periodoRef varchar(400))
RETURNS int
READS SQL DATA 
begin	
	DECLARE resultado int;
    SET resultado = (select p.idPeriodoAcademico AS idPeriodo
					 FROM PeriodoAcademico as p
					 WHERE p.periodoAcademico = periodoRef);
    RETURN resultado;
END$$

/*------obtener id Nota Definitiva del Periodo-----*/
DELIMITER $$
CREATE FUNCTION obtenerIdNotaDefinitivaPeriodo(periodoRef varchar(400), asignaturaRef varchar(400))
RETURNS int
READS SQL DATA 
begin	
	DECLARE resultado int;
    SET resultado = (select ndp.idNotas 
					 FROM NotaDefinitivaPeriodo as ndp
					 WHERE ndp.fkidAsignatura = (select ObtenerIdAsignatura(asignaturaRef)) 
                     and ndp.fkidPeriodoAcademico = (select ObtenerIdPeriodo(periodoRef))
                     );
    RETURN resultado;
END$$

/*------obtener id NotasEstudiante-----*/
DELIMITER $$
CREATE FUNCTION obtenerIdNotasEstudiante(idEstudiante int)
RETURNS int
READS SQL DATA 
begin	
	DECLARE resultado int;
    SET resultado = (select ne.idNotaEstudiante 
					 FROM NotasEstudiante as ne
					 WHERE ne.fkidEstudiante = idEstudiante
                     ORDER BY ne.idNotaEstudiante DESC LIMIT 1);
    RETURN resultado;
END$$

/*------existe id Notas Estudiante Asignatura-----*/
DELIMITER $$
CREATE FUNCTION obtenerIdNotaEstudianteAsignatura(idEstudiante int, asignaturaRef varchar(400), peridoRef varchar(400))
RETURNS int
READS SQL DATA 
begin	
	DECLARE resultado int;
    SET resultado = (select ne.idNotaEstudiante 
					 FROM NotasEstudiante as ne
                     inner join NotaDefinitivaPeriodo as ndp on ndp.fkidNotaEstudiante = ne.idNotaEstudiante
					 WHERE ne.fkidEstudiante = idEstudiante and ndp.fkidAsignatura = (select ObtenerIdAsignatura(asignaturaRef))
                     and ndp.fkidPeriodoAcademico = (select obtenerIdPeriodo(peridoRef)));
    RETURN resultado;
END$$

/*------buscar id de Existe Notas Estudiante Asignatura-----*/
DELIMITER $$
CREATE FUNCTION FunexisteNotasEstudianteAsignatura(idEstudiante int, asignaturaRef varchar(400), peridoRef varchar(400))
RETURNS int
READS SQL DATA 
begin	
	DECLARE resultado int;
    SET resultado = (SELECT COUNT(*) > 0 AS existe_valor
	FROM NotasEstudiante as ne
    inner join NotaDefinitivaPeriodo as ndp on ndp.fkidNotaEstudiante = ne.idNotaEstudiante
	WHERE ne.fkidEstudiante = idEstudiante and ndp.fkidAsignatura = (select ObtenerIdAsignatura(asignaturaRef))
    and ndp.fkidPeriodoAcademico = (select obtenerIdPeriodo(peridoRef)));
    RETURN resultado;
END$$

/*------existe id Asistencia Estudiante Asignatura-----*/
DELIMITER $$
CREATE FUNCTION obtenerIdAsistenciaEstudianteAsignatura(idEstudiante int, asignaturaRef varchar(400), peridoRef varchar(400))
RETURNS int
READS SQL DATA 
begin	
	DECLARE resultado int;
    SET resultado = (select ae.idAsistenciaGradoGrupo 
					 FROM AsistenciaEstudiante as ae
                     inner join Asistencia as a on ae.fkidAsistencia = a.idAsistencia
					 WHERE ae.fkidEstudiante = idEstudiante and a.fkidAsignatura = (select ObtenerIdAsignatura(asignaturaRef))
                     and a.fkidPeriodoAcademico = (select obtenerIdPeriodo(peridoRef)));
    RETURN resultado;
END$$

/*------existe Inasistencia Estudiante Asignatura-----*/
DELIMITER $$
CREATE FUNCTION obtenerInasistenciaEstudianteAsignatura(idEstudiante int, asignaturaRef varchar(400), peridoRef varchar(400))
RETURNS VARCHAR(45)
READS SQL DATA 
begin	
	DECLARE resultado VARCHAR(45);
    SET resultado = (SELECT ae.nFallas 
					 FROM AsistenciaEstudiante as ae
                     inner join Asistencia as a on ae.fkidAsistencia = a.idAsistencia
					 WHERE ae.fkidEstudiante = idEstudiante and a.fkidAsignatura = (select ObtenerIdAsignatura(asignaturaRef))
                     and a.fkidPeriodoAcademico = (select obtenerIdPeriodo(peridoRef)));
    RETURN resultado;
END$$

/*------existe Carga Horaria Asignatura-----*/
DELIMITER $$
CREATE FUNCTION obtenerCargaHorariaAsignatura(asignaturaRef varchar(400), grupoRef varchar(400))
RETURNS int
READS SQL DATA 
begin	
	DECLARE resultado INT;
    SET resultado = (SELECT agg.horasSemanales
					 FROM GradoGrupo AS gg
                     INNER JOIN asignaturaGradoGrupo AS agg ON agg.fkidGradoGrupo = gg.idGradoGrupo
                     INNER JOIN Asignatura AS a ON agg.fkidAsignatura = a.idAsignatura
					 WHERE a.nombreAsignatura = asignaturaRef AND gg.grupoGrado = grupoRef
                     );
    RETURN resultado;
END$$

/*------obtener id Asistencia Estudiante-----*/
DELIMITER $$
CREATE FUNCTION obtenerIdAsistenciaEstudiante(idEstudiante int)
RETURNS int
READS SQL DATA 
begin	
	DECLARE resultado int;
    SET resultado = (select ae.idAsistenciaEstudiante 
					 FROM AsistenciaEstudiante as ae
					 WHERE ae.fkidEstudiante = idEstudiante
                     ORDER BY ae.idNotaEstudiante DESC LIMIT 1);
    RETURN resultado;
END$$

/*------obtener Nota Estudiante-----*/
DELIMITER $$
CREATE FUNCTION obtenerNotaEstudiante(idEstudiante int)
RETURNS float
READS SQL DATA 
begin	
	DECLARE resultado float;
    SET resultado = (select ne.notaDefinitiva 
					 FROM NotasEstudiante as ne
					 WHERE ne.fkidEstudiante = idEstudiante
                     ORDER BY ne.idNotaEstudiante DESC LIMIT 1);
    RETURN resultado;
END$$

/*------obtener Promedio Nota Estudiante-----*/

DELIMITER $$
CREATE FUNCTION obtenerPromedioAsignaturaEstudiantePeriodo(idEstudianteRef int, Asignatura varchar(400), grupoRef varchar(400))
RETURNS float
READS SQL DATA 
begin	
	DECLARE resultado float;
    DECLARE sumaNotasEstudiante float;
    DECLARE numeroNotas int;
    DECLARE periodos int;
	set periodos = 4;
        
    set sumaNotasEstudiante = (SELECT SUM(ndp.notaGeneral) as Nota
									From Estudiante as e 
									inner join NotasEstudiante as ne on ne.fkidEstudiante = e.idEstudiante
									inner join NotaDefinitivaPeriodo as ndp on ndp.fkidNotaEstudiante = ne.idNotaEstudiante
									where e.IdEstudiante = idEstudianteRef and ndp.fkidAsignatura = (select ObtenerIdAsignatura(Asignatura))
                                    );	
    
    SET resultado = (select sumaNotasEstudiante / periodos as PromedioAsignatura);
    RETURN resultado;
END$$

/*------obtener Sumatoria Inasistencias Estudiante-----*/
DELIMITER $$
CREATE FUNCTION obtenerSumaInasistenciasEstudianteAnno(idEstudianteRef int, Asignatura varchar(400), grupoRef varchar(400))
RETURNS float
READS SQL DATA 
begin	
	DECLARE resultado float;          
    set resultado = (SELECT SUM(ae.nFallas) as Fallas
									From Estudiante as e 
									inner join AsistenciaEstudiante as ae on ae.fkidEstudiante = e.idEstudiante
									inner join Asistencia as a on ae.fkidAsistencia = a.idAsistencia
									where e.IdEstudiante = idEstudianteRef and a.fkidAsignatura = (select ObtenerIdAsignatura(Asignatura))
                                    );	
    RETURN resultado;
END$$

/*------buscar id de Existe Notas Estudiante-----*/
DELIMITER $$
CREATE FUNCTION FunexisteNotasEstudiante()
RETURNS int
READS SQL DATA 
begin	
	DECLARE resultado int;
    SET resultado = (SELECT COUNT(ne.notaDefinitiva) > 1 AS existe_valor
					 FROM NotasEstudiante as ne);
    RETURN resultado;
END$$

/*------obtener id Asistencia Asignatura Periodo-----*/
DELIMITER $$
CREATE FUNCTION obtenerIdAsistenciaAsignaturaPeriodo(periodoRef varchar(400), asignaturaRef varchar(400))
RETURNS int
READS SQL DATA 
begin	
	DECLARE resultado int;
    SET resultado = (select a.idAsistencia
					 FROM Asistencia as a
					 WHERE a.fkidAsignatura = (select ObtenerIdAsignatura(asignaturaRef)) 
                     and a.fkidPeriodoAcademico = (select ObtenerIdPeriodo(periodoRef))
                     ORDER BY a.idAsistencia DESC LIMIT 1);
    RETURN resultado;
END$$

-- -----------------------------------------------------
-- TRIGGER - ACTUALIZAR - `PustosGrupo`
-- -----------------------------------------------------
/*
DELIMITER $$
CREATE TRIGGER actualizar_posiciones_desde_notas
AFTER INSERT ON NotasEstudiante
FOR EACH ROW
BEGIN
    if(FunexistePeriodo() = 0) then
		set NotasEstudiante.puestoNota = 1;
    end if;
END$$
DELIMITER ;*/

