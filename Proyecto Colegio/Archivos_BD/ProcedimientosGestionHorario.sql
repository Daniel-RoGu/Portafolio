/*-------orden de ejecucion de scripts ---------- Script Nº7*/
use bdColegio;

/*--------------------------Registrar Periodo Academico-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarPeriodoAcademico` $$
create procedure `registrarPeriodoAcademico`(
    nombrePeriodo varchar(400),
    fechaComienza varchar(400),
    fechaTermina varchar(400)
) 
begin    
	insert into PeriodoAcademico (periodoAcademico, fechaInicio, fechaFin, estadoPeriodo, añoElectivo) 
    value (nombrePeriodo, fechaComienza, fechaTermina, "Habilitado", (SELECT YEAR(NOW())));
END$$

/*--------------------------Registrar horario-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS RegistrarHorario $$
CREATE PROCEDURE RegistrarHorario(
    IN nombreSedeRH VARCHAR(400), 
    IN nomAsignatura VARCHAR(400), 
    IN nomGrupo VARCHAR(400), 
    IN identificacionDocente VARCHAR(400), 
    IN diaHorarioClase VARCHAR(400), 
    IN rangoHorario VARCHAR(400)
) 
BEGIN
    DECLARE horaInicioClase VARCHAR(400);
    DECLARE horaFinClase VARCHAR(400);
    DECLARE grupoSelect INT;

    IF (existeHorario(rangoHorario, diaHorarioClase) = 0) 
	THEN
        SET horaInicioClase = LEFT(SUBSTRING_INDEX(rangoHorario, '-', 1), 5); /*En (06:00-07:00) obtiene la primera hora*/
        SET horaFinClase = RIGHT(SUBSTRING_INDEX(rangoHorario, '-', -1), 5); /*En (06:00-07:00) obtiene la segunda hora*/

        INSERT INTO horario (horaInicio, horaFin, fechaHorario, diaHorario, estadoHorario) 
        VALUES (horaInicioClase, horaFinClase, "", diaHorarioClase, "Asignado");

        SET grupoSelect = (SELECT gg.idGradoGrupo 
                           FROM Sede AS s
                           INNER JOIN SedeGrados AS sg ON sg.fkidSede = s.idSede
                           INNER JOIN Grados AS g ON sg.fkidGrado = g.idGrado
                           INNER JOIN GradoGrupo AS gg ON gg.fkidGrado = g.idGrado AND gg.grupoGrado = nomGrupo
                           WHERE s.nombreSede = nombreSedeRH limit 1);
        
        if ((existeGrupoHorario(nomGrupo, rangoHorario, diaHorarioClase)) = 0) then
			INSERT INTO horarioGradoGrupo (estadoHorarioGG, fkidHorario, fkidGradoGrupo) 
			VALUES ("Asignado", (SELECT ObtenerIdHorario(rangoHorario, diaHorarioClase)), grupoSelect);
        end if;       
		
        if ((existeAsignaturaHorario(nomAsignatura, rangoHorario, diaHorarioClase) = 0)) then
			INSERT INTO horarioAsignatura (estadoHorarioAsignatura, fkidHorario, fkidAsignatura) 
			VALUES ("Asignado", (SELECT ObtenerIdHorario(rangoHorario, diaHorarioClase)), (SELECT ObtenerIdAsignatura(nomAsignatura)));
        end if;
		
		if (existeDocenteHorario( (select ObtenerIdDocente(identificacionDocente)), rangoHorario, diaHorarioClase) = 0) then
			INSERT INTO horarioDocente (estadoHorarioDocente, fkidHorario, fkidDocente) 
			VALUES ("Asignado", (SELECT ObtenerIdHorario(rangoHorario, diaHorarioClase)), (SELECT ObtenerIdDocente(identificacionDocente)));
        end if;
        
		select 1;
    else
		select 0;
    END IF;
END$$
DELIMITER ;

/*--------------------------Mostrar horario Vista Funcionario-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS MostrarHorario $$
CREATE PROCEDURE MostrarHorario(
    IN nombreSedeRH VARCHAR(400),
    IN nomGrupo VARCHAR(400)
) 
BEGIN
    
    SELECT CONCAT(h.horaInicio, '-', h.horaFin) AS RangoHorario, h.diaHorario AS DiaHorario, (CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
		   COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, ''))) AS Docente, a.nombreAsignatura AS NombreAsignatura
	FROM Sede AS s
    INNER JOIN SedeGrados AS sg ON sg.fkidSede = s.idSede
    INNER JOIN Grados as g ON sg.fkidGrado = g.idGrado
    INNER JOIN GradoGrupo AS gg ON gg.fkidGrado = g.idGrado AND gg.grupoGrado = nomGrupo
    INNER JOIN horarioGradoGrupo AS hgg ON hgg.fkidGradoGrupo = gg.idGradoGrupo
    INNER JOIN Horario AS h on hgg.fkidHorario = h.idHorario
    INNER JOIN horarioAsignatura AS ha ON ha.fkidHorario = h.idHorario
    INNER JOIN Asignatura AS a ON ha.fkidAsignatura = a.idAsignatura 
    INNER JOIN DocenteAsignatura AS da ON da.fkidAsignatura = a.idAsignatura 
    INNER JOIN Docente AS d ON da.fkidDocente = d.idDocente
    INNER JOIN horarioDocente AS hd ON hd.fkidDocente = d.idDocente AND hd.fkidHorario = h.idHorario
    LEFT JOIN Usuario AS u ON d.fkidentificacion = u.identificacion
    WHERE s.nombreSede = nombreSedeRH;  
   
END$$
DELIMITER ;

/*--------------------------Mostrar horario Vista Funcionario-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS MostrarHorarioPorRango $$
CREATE PROCEDURE MostrarHorarioPorRango(
    IN 
    nombreSedeRH VARCHAR(400),
    nomGrupo VARCHAR(400),
    rangoHorario VARCHAR(400),
    dia VARCHAR(400)
) 
BEGIN
    DECLARE hInicio VARCHAR(400);
    DECLARE hFin VARCHAR(400);
    SET hInicio = LEFT(SUBSTRING_INDEX(rangoHorario, '-', 1), 5); /*En (06:00-07:00) obtiene la primera hora*/
    SET hFin = RIGHT(SUBSTRING_INDEX(rangoHorario, '-', -1), 5); /*En (06:00-07:00) obtiene la segunda hora*/
        
    SELECT CONCAT(h.horaInicio, '-', h.horaFin) AS RangoHorario, h.diaHorario AS DiaHorario, (CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
		   COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, ''))) AS Docente, a.nombreAsignatura AS NombreAsignatura
	FROM Sede AS s
    INNER JOIN SedeGrados AS sg ON sg.fkidSede = s.idSede
    INNER JOIN Grados as g ON sg.fkidGrado = g.idGrado
    INNER JOIN GradoGrupo AS gg ON gg.fkidGrado = g.idGrado AND gg.grupoGrado = nomGrupo
    INNER JOIN horarioGradoGrupo AS hgg ON hgg.fkidGradoGrupo = gg.idGradoGrupo
    INNER JOIN Horario AS h on hgg.fkidHorario = h.idHorario AND h.horaInicio = hInicio AND h.horaFin = hFin AND h.diaHorario = dia
    INNER JOIN horarioAsignatura AS ha ON ha.fkidHorario = h.idHorario
    INNER JOIN Asignatura AS a ON ha.fkidAsignatura = a.idAsignatura 
    INNER JOIN DocenteAsignatura AS da ON da.fkidAsignatura = a.idAsignatura 
    INNER JOIN Docente AS d ON da.fkidDocente = d.idDocente
    INNER JOIN horarioDocente AS hd ON hd.fkidDocente = d.idDocente AND hd.fkidHorario = h.idHorario
    LEFT JOIN Usuario AS u ON d.fkidentificacion = u.identificacion
    WHERE s.nombreSede = nombreSedeRH;  
   
END$$
DELIMITER ;


/*--------------------------Eliminar horario-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS EliminarHorario $$
CREATE PROCEDURE EliminarHorario(
    IN 
    rangoHorario VARCHAR(400),
    diaHorarioClase VARCHAR(400)
) 
BEGIN
    
    DECLARE horaInicioClase VARCHAR(400);
    DECLARE horaFinClase VARCHAR(400);
    DECLARE idHorarioRef BIGINT;
    SET horaInicioClase = LEFT(SUBSTRING_INDEX(rangoHorario, '-', 1), 5); /*En (06:00-07:00) obtiene la primera hora*/
    SET horaFinClase = RIGHT(SUBSTRING_INDEX(rangoHorario, '-', -1), 5); /*En (06:00-07:00) obtiene la segunda hora*/
	SET idHorarioRef = (select ObtenerIdHorario(rangoHorario, diaHorarioClase));
    
    DELETE FROM horarioAsignatura AS ha WHERE ha.fkidHorario = idHorarioRef;
    DELETE FROM horarioGrupo AS hg WHERE hg.fkidHorario = idHorarioRef;
    DELETE FROM Horario AS h WHERE h.idHorario = idHorarioRef;
    
END$$
DELIMITER ;

/*--------------------------Obtener Docentes de la Asigantura-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS ObtenerDocentesAsignatura $$
CREATE PROCEDURE ObtenerDocentesAsignatura(
    IN nomAsignatura VARCHAR(400)
) 
BEGIN
    
    SELECT (CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
		   COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, ''))) AS Docente
	FROM Asignatura AS a
    INNER JOIN DocenteAsignatura AS da ON da.fkidAsignatura = a.idAsignatura
    INNER JOIN Docente AS d ON da.fkidDocente = d.idDocente
    INNER JOIN Usuario AS u On d.fkidentificacion = u.identificacion
    WHERE a.nombreAsignatura = nomAsignatura;
    
END$$
DELIMITER ;

/*--------------------------Mostrar horario Vista Docente-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS MostrarHorarioDocente $$
CREATE PROCEDURE MostrarHorarioDocente(
    IN 
    nombreSedeRH VARCHAR(400),
    nomGrupo VARCHAR(400),
    documentoDocente BIGINT
) 
BEGIN
    
    SELECT h.horaInicio AS HoraInicio, h.horaFin AS HoraFin, h.diaHorario AS DiaHorario, (CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
		   COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, ''))) AS Docente, a.nombreAsignatura AS NombreAsignatura, gg.grupoGrado AS Grupo
	FROM Sede AS s
    INNER JOIN SedeGrados AS sg ON sg.fkidSede = s.idSede
    INNER JOIN Grados as g ON sg.fkidGrado = g.idGrado
    INNER JOIN GradoGrupo AS gg ON gg.fkidGrado = g.idGrado AND gg.grupoGrado = nomGrupo
    INNER JOIN horarioGradoGrupo AS hgg ON hgg.fkidGradoGrupo = gg.idGradoGrupo
    INNER JOIN Horario AS h on hgg.fkidHorario = h.idHorario
    INNER JOIN horarioAsignatura AS ha ON ha.fkidHorario = h.idHorario
    INNER JOIN Asignatura AS a ON ha.fkidAsignatura = a.idAsignatura 
    INNER JOIN DocenteAsigantura AS da ON da.fkidAsignatura = a.idAsignatura 
    INNER JOIN Docente AS d ON da.fkidDocente = d.idDocente AND d.fkidentificacion = documentoDocente
    INNER JOIN horarioDocente AS hd ON hd.fkidDocente = d.idDocente AND hd.fkidHorario = h.idHorario
    LEFT JOIN Usuario AS u ON d.fkidentificacion = u.identificacion
    WHERE s.nombreSede = nombreSedeRH;    
   
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS MostrarHorarioPorRangoDocente $$
CREATE PROCEDURE MostrarHorarioPorRangoDocente(
    IN 
    docDocente bigint,
    nombreSedeRH VARCHAR(400),
    rangoHorario VARCHAR(400),
    dia VARCHAR(400)
) 
BEGIN
    DECLARE hInicio VARCHAR(400);
    DECLARE hFin VARCHAR(400);
    DECLARE idDocente int;
    SET idDocente = (select ObtenerIdDocente(docDocente));
    SET hInicio = LEFT(SUBSTRING_INDEX(rangoHorario, '-', 1), 5); /*En (06:00-07:00) obtiene la primera hora*/
    SET hFin = RIGHT(SUBSTRING_INDEX(rangoHorario, '-', -1), 5); /*En (06:00-07:00) obtiene la segunda hora*/
        
    SELECT distinct CONCAT(h.horaInicio, '-', h.horaFin) AS RangoHorario, h.diaHorario AS DiaHorario, 
    CONCAT(COALESCE('Grado:'), ' ', COALESCE(g.nombreGrado, ''), '  -  ', COALESCE('Grupo:'), ' ', COALESCE(gg.grupoGrado, '')) AS InfoGrado, 
    a.nombreAsignatura AS NombreAsignatura
	FROM Sede AS s
    INNER JOIN SedeGrados AS sg ON sg.fkidSede = s.idSede
    INNER JOIN Grados as g ON sg.fkidGrado = g.idGrado
    INNER JOIN GradoGrupo AS gg ON gg.fkidGrado = g.idGrado
    INNER JOIN horarioGradoGrupo AS hgg ON hgg.fkidGradoGrupo = gg.idGradoGrupo
    INNER JOIN Horario AS h on hgg.fkidHorario = h.idHorario AND h.horaInicio = hInicio AND h.horaFin = hFin AND h.diaHorario = dia
    INNER JOIN horarioAsignatura AS ha ON ha.fkidHorario = h.idHorario
    INNER JOIN Asignatura AS a ON ha.fkidAsignatura = a.idAsignatura 
    INNER JOIN DocenteAsignatura AS da ON da.fkidAsignatura = a.idAsignatura 
    INNER JOIN Docente AS d ON da.fkidDocente = d.idDocente
    INNER JOIN horarioDocente AS hd ON hd.fkidDocente = d.idDocente AND hd.fkidHorario = h.idHorario
    LEFT JOIN Usuario AS u ON d.fkidentificacion = u.identificacion
    WHERE s.nombreSede = nombreSedeRH AND d.idDocente = idDocente;  
   
END$$
DELIMITER ;


/*--------------------------Mostrar horario Vista Estudiante-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS MostrarHorarioEstudiante $$
CREATE PROCEDURE MostrarHorarioEstudiante(
    IN 
    nombreSedeRH VARCHAR(400),
    nomGrupo VARCHAR(400),
    rangoHorario VARCHAR(400),
    dia VARCHAR(400),
    documentoEstudiante BIGINT
) 
BEGIN
    DECLARE hInicio VARCHAR(400);
    DECLARE hFin VARCHAR(400);
    SET hInicio = LEFT(SUBSTRING_INDEX(rangoHorario, '-', 1), 5); /*En (06:00-07:00) obtiene la primera hora*/
    SET hFin = RIGHT(SUBSTRING_INDEX(rangoHorario, '-', -1), 5); /*En (06:00-07:00) obtiene la segunda hora*/
    
    SELECT h.horaInicio AS HoraInicio, h.horaFin AS HoraFin, h.diaHorario AS DiaHorario, (CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
		   COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, ''))) AS Docente, a.nombreAsignatura AS NombreAsignatura, gg.grupoGrado AS Grupo
	FROM Sede AS s
    INNER JOIN SedeGrados AS sg ON sg.fkidSede = s.idSede
    INNER JOIN Grados as g ON sg.fkidGrado = g.idGrado
    INNER JOIN GradoGrupo AS gg ON gg.fkidGrado = g.idGrado AND gg.grupoGrado = nomGrupo
    INNER JOIN horarioGradoGrupo AS hgg ON hgg.fkidGradoGrupo = gg.idGradoGrupo
    INNER JOIN Horario AS h on hgg.fkidHorario = h.idHorario AND h.horaInicio = hInicio AND h.horaFin = hFin AND h.diaHorario = dia
    INNER JOIN horarioAsignatura AS ha ON ha.fkidHorario = h.idHorario
    INNER JOIN Asignatura AS a ON ha.fkidAsignatura = a.idAsignatura
    INNER JOIN DocenteAsignatura AS da ON da.fkidAsignatura = a.idAsignatura 
    INNER JOIN Docente AS d ON da.fkidDocente = d.idDocente
    INNER JOIN horarioDocente AS hd ON hd.fkidDocente = d.idDocente AND hd.fkidHorario = h.idHorario
    LEFT JOIN Usuario AS u ON d.fkidentificacion = u.identificacion
    INNER JOIN Estudiante AS e ON e.idEstudiante = ( SELECT ObtenerIdEstudiante(documentoEstudiante))
    INNER JOIN Matricula AS m ON m.fkidSede = s.idSede AND m.fkidEstudiante = e.idEstudiante
    LEFT JOIN EstudiantesGradoGrupo AS egg ON egg.fkidEstudiante = e.idEstudiante AND egg.fkidGradoGrupo = gg.idGradoGrupo
    WHERE s.nombreSede = nombreSedeRH;    
   
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS MostrarHorarioPorRangoEstudiante $$
CREATE PROCEDURE MostrarHorarioPorRangoEstudiante(
    IN
    documentoEstudiante BIGINT,
    nombreSedeRH VARCHAR(400),
    nomGrupo VARCHAR(400),
    rangoHorario VARCHAR(400),
    dia VARCHAR(400)
) 
BEGIN
    DECLARE hInicio VARCHAR(400);
    DECLARE hFin VARCHAR(400);
    SET hInicio = LEFT(SUBSTRING_INDEX(rangoHorario, '-', 1), 5); /*En (06:00-07:00) obtiene la primera hora*/
    SET hFin = RIGHT(SUBSTRING_INDEX(rangoHorario, '-', -1), 5); /*En (06:00-07:00) obtiene la segunda hora*/
    
     
    SELECT subconsulta1.Docente, subconsulta1.RangoHorario, subconsulta1.DiaHorario, subconsulta1.NombreAsignatura 
	FROM (
		-- Subconsulta 1
		SELECT DISTINCT CONCAT(h.horaInicio, '-', h.horaFin) AS RangoHorario, h.diaHorario AS DiaHorario, 
					(CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
					COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, ''))) AS Docente, 
					a.nombreAsignatura AS NombreAsignatura, gg.IdGradoGrupo AS IdGrupo, s.idSede as IdSede
		FROM Sede AS s
		INNER JOIN SedeGrados AS sg ON sg.fkidSede = s.idSede
		INNER JOIN Grados as g ON sg.fkidGrado = g.idGrado
		INNER JOIN GradoGrupo AS gg ON gg.fkidGrado = g.idGrado AND gg.grupoGrado = nomGrupo
		INNER JOIN horarioGradoGrupo AS hgg ON hgg.fkidGradoGrupo = gg.idGradoGrupo
		INNER JOIN Horario AS h on hgg.fkidHorario = h.idHorario AND h.horaInicio = hInicio AND h.horaFin = hFin AND h.diaHorario = dia
		INNER JOIN horarioAsignatura AS ha ON ha.fkidHorario = h.idHorario
		INNER JOIN Asignatura AS a ON ha.fkidAsignatura = a.idAsignatura 
		INNER JOIN DocenteAsignatura AS da ON da.fkidAsignatura = a.idAsignatura 
		INNER JOIN Docente AS d ON da.fkidDocente = d.idDocente
		INNER JOIN horarioDocente AS hd ON hd.fkidDocente = d.idDocente AND hd.fkidHorario = h.idHorario
		INNER JOIN Usuario AS u ON d.fkidentificacion = u.identificacion
		WHERE s.nombreSede = nombreSedeRH 
    ) AS subconsulta1
    INNER JOIN (
        -- Subconsulta 2
        SELECT DISTINCT CONCAT(h.horaInicio, '-', h.horaFin) AS RangoHorario2, h.diaHorario AS DiaHorario2,
					(CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
					COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, ''))) AS Estudiante,
                    gg.IdGradoGrupo AS IdGrupo2, s.idSede as IdSede2
        FROM Horario as h
        INNER JOIN horarioGradoGrupo AS hgg ON hgg.fkidHorario
        INNER JOIN GradoGrupo AS gg ON hgg.fkidGradoGrupo = gg.idGradoGrupo 
        INNER JOIN EstudiantesGradoGrupo AS egg ON egg.fkidGradoGrupo = gg.idGradoGrupo
		INNER JOIN Estudiante AS e ON egg.fkidEstudiante = e.idEstudiante
        INNER JOIN Usuario AS u ON e.Usuario_identificacion = u.identificacion
        INNER JOIN Matricula AS m ON m.fkidEstudiante = e.idEstudiante
        INNER JOIN Sede AS s ON m.fkidSede = s.idSede
        WHERE s.nombreSede = nombreSedeRH AND e.Usuario_identificacion = documentoEstudiante AND gg.grupoGrado = nomGrupo 
        AND h.horaInicio = hInicio AND h.horaFin = hFin AND h.diaHorario = dia
    ) AS subconsulta2 ON subconsulta1.RangoHorario = subconsulta2.RangoHorario2 AND subconsulta1.DiaHorario = subconsulta2.DiaHorario2;
   
END$$
DELIMITER ;