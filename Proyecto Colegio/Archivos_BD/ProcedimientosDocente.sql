/*-------orden de ejecucion de scripts ---------- Script Nº6*/
use bdColegio;

/*--------------------------Registrar Docente-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarDocente` $$
create procedure `registrarDocente`(
    horasTrabaja varchar(45),
    nomSede varchar(400),
    documento varchar(400),    
    lugarExpedicionDoc varchar(400),    
	nomUsuario varchar(400),
    nom2Usuario varchar(400),
    apellidoUsuario varchar(400),
    apellido2Usuario varchar(400),
    edad int,
    telCelular varchar(100),
    telFijo varchar(100),
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
    nombreEstrato varchar(400)
) 
begin
	call registrarUsuario((SELECT CAST(documento AS SIGNED)), nomUsuario, nom2Usuario, apellidoUsuario, apellido2Usuario, edad, telCelular, telFijo, correoUss,
						  direccionUss, barrioUss, fechaNacimientoUss, tipoSangre, tipoDocumento, nombreDiscapacidad, nombreSisben, nombreGenero,
                          nombreEps, nombreEstrato, "Docente");
	insert into Docente (estadoDocente, horasLaboralesSemanales, lugarExpedicionDocumento, fkidentificacion, fkidSede)
				value("Activo", horasTrabaja, lugarExpedicionDoc, (SELECT CAST(documento AS SIGNED)), (select ObtenerIdSede(nomSede)));
END$$

/*--------------------------Registrar Docente Grado-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarDocenteGrado` $$
create procedure `registrarDocenteGrado`(
    nombreDocente varchar(400),
    nomGrupo varchar(400)
) 
begin
	declare identificacionDocente long;
    declare identificacionGrupo varchar(400);
    set identificacionDocente = (SELECT d.idDocente FROM docente AS d
								 INNER JOIN usuario AS u ON CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
																   COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, '')) COLLATE utf8mb4_unicode_ci = nombreDocente
								 WHERE d.fkidentificacion = u.identificacion);
	set identificacionGrupo = (select g.idGrado from gradogrupo as gg 
							   inner join Grados as g on gg.fkidGrado = g.idGrado
                               where gg.grupoGrado = nomGrupo);
	insert into DocentesGrado (estadoDocenteGrado, fkidDocente, fkidGrado)				
				value("Activo", identificacionDocente, identificacionGrupo );
END$$

/*--------------------------Registrar Docente Grado-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarDocenteGrado2` $$
create procedure `registrarDocenteGrado2`(
    idDocente varchar(400),
    gradroRef int
) 
begin
    declare identificacionGrupo varchar(400);
	insert into DocentesGrado (estadoDocenteGrado, fkidDocente, fkidGrado)				
				value("Activo", idDocente, (select ObtenerIdGrado(gradroRef)));
END$$

/*--------------------------Registrar Docente Asignatura-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarDocenteAsignatura` $$
create procedure `registrarDocenteAsignatura`(
    nombreDocente varchar(400),
    asignatura varchar(400)
    /*horasSemanalesRef int*/
) 
begin
	declare identificacionDocente long;
    set identificacionDocente = (SELECT d.idDocente FROM docente AS d
								 INNER JOIN usuario AS u ON CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
																   COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, '')) COLLATE utf8mb4_unicode_ci = nombreDocente
								 WHERE d.fkidentificacion = u.identificacion);
	insert into DocenteAsignatura (estadoDocenteAsignatura, fkidDocente, fkidAsignatura)				
				value("Asignado", identificacionDocente, (select ObtenerIdAsignatura(asignatura)) );
END$$

/*--------------------------Obtener Docente-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerDocente` $$
create procedure `obtenerDocente`(identificacion varchar(400)) 
begin
	SELECT (CONCAT(COALESCE(Usuario.primerNombreUsuario, ''), ' ', COALESCE(Usuario.segundoNombreUsuario, ''), 
            COALESCE(Usuario.primerApellidoUsuario, ''), ' ', COALESCE(Usuario.segundoApellidoUsuario, ''))) AS Docente
    FROM Docente 
    inner join Usuario on Docente.fkidentificacion = Usuario.identificacion
    where Docente.fkidentificacion = (CAST(identificacion AS SIGNED));
END$$

/*--------------------------Obtener Docentes-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerDocentes` $$
CREATE PROCEDURE `obtenerDocentes`() 
BEGIN
    SELECT  Docente.idDocente as IdDocente,
			(CONCAT(COALESCE(Usuario.primerNombreUsuario, ''), ' ', COALESCE(Usuario.segundoNombreUsuario, ''), 
            COALESCE(Usuario.primerApellidoUsuario, ''), ' ', COALESCE(Usuario.segundoApellidoUsuario, ''))) AS Docente
    FROM Docente 
    INNER JOIN Usuario ON Docente.fkidentificacion = Usuario.identificacion;
END$$

/*--------------------------Obtener Estudiantes Grupo-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerEstudiantesGrupo` $$
create procedure `obtenerEstudiantesGrupo`(nomGrupo varchar(400)) 
begin
	select distinct Us.identificacion as documento, Us.primerNombreUsuario as nomUsuario, Us.segundoNombreUsuario as nom2Usuario, 
		   Us.primerApellidoUsuario as apellidoUsuario, Us.segundoApellidoUsuario as apellido2Usuario, Us.edadUsuario as edad,
		   Us.telefonoCelular as telCelular, Us.telefonoFijo as telFijo, Us.correo as correoUss, 
           Us.direccion as direccioUss, Us.barrioUbicacionUsuario as barrioUss, Us.fechaNacimiento as fechaNacimientoUss, Us.estadoUsuario as estadoUss, 
           COALESCE((select ObtenerNombreTipoSangre(Us.fkidTipoSangre)), 'Sin definir') as tipoSangre,
           COALESCE((select ObtenerNombreTipoDocumento(Us.fkidTipoDocumento)), 'Sin definir') as tipoDocumento, 
           COALESCE((select ObtenerNombreDiscapacidad(Us.fkidDiscapacidad)), 'Sin definir') as nombreDiscapacidad, 
           COALESCE((select ObtenerNombreSisben(Us.fkidSisben)), 'Sin definir') as nombreSisben,
           COALESCE((select ObtenerNombreGenero(Us.fkidGenero)), 'Sin definir') as nombreGenero, 
           COALESCE((SELECT ObtenerNombreEPS(Us.fkidEPS)), 'Sin definir') AS nombreEPS, 
           COALESCE((select ObtenerNombreEstrato(Us.fkidEstrato)), 'Sin definir') as nombreEstrato
	From GradoGrupo as gg
    inner join estudiantesGradoGrupo as egg on egg.fkidGradoGrupo = gg.idGradoGrupo
    inner join Estudiante as e on egg.fkidEstudiante = e.idEstudiante
    inner join Usuario as Us on e.Usuario_identificacion = Us.identificacion
    where gg.grupoGrado = nomGrupo;
    
END$$

/*--------------------------Obtener Sede Docente-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerSedeDocente` $$
CREATE PROCEDURE `obtenerSedeDocente`(identificacion varchar(400)) 
BEGIN
    SELECT s.nombreSede AS Sede
    FROM Docente 
    INNER JOIN Sede as s ON Docente.fkidSede = s.idSede
    where Docente.idDocente = (select ObtenerIdDocente(CAST(identificacion AS SIGNED)));
END$$

/*--------------------------Obtener Docentes Sede-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerDocenteSede` $$
create procedure `ObtenerDocenteSede`(
	sedeRef varchar(400)
) 
begin
    SELECT  d.idDocente as IdDocente,
			CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
				  COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, '')) COLLATE utf8mb4_unicode_ci as Docentes
	From Sede as s
    inner join Docente as d on d.fkidSede = s.idSede 
    inner join Usuario as u on d.fkidentificacion = u.identificacion
    where s.nombreSede = sedeRef;
END$$

/*--------------------------Obtener Docentes Sede Grado-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerDocentesSedeGrado` $$
create procedure `ObtenerDocentesSedeGrado`(
	sedeRef varchar(400),
    nomGrupo varchar(400)
) 
begin
	declare nomGrado varchar(400);
    set nomGrado = (select g.nombreGrado from Grados as g
				   inner join GradoGrupo as gg on gg.fkidGrado = g.idGrado and gg.grupoGrado = nomGrupo);
    SELECT  d.idDocente as IdDocente,
			CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
				  COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, '')) COLLATE utf8mb4_unicode_ci as Docentes
	From Sede as s
    inner join Docente as d on d.fkidSede = s.idSede 
    inner join Usuario as u on d.fkidentificacion = u.identificacion
    left join DocentesGrado as dg on dg.fkidDocente = d.idDocente 
    inner join Grados as g on dg.fkidGrado = g.idGrado and g.nombreGrado = nomGrado
    where s.nombreSede = sedeRef;
END$$

/*--------------------------Obtener Informacion Docentes Sede-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerInfoDocenteSede` $$
create procedure `ObtenerInfoDocenteSede`(
	sedeRef varchar(400)
) 
begin
    SELECT d.idDocente as IdDocente,
		   CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
		   COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, '')) 
		   COLLATE utf8mb4_unicode_ci as Docente,
		   u.identificacion as Identificacion, COALESCE((select ObtenerNombreTipoSangre(fkidTipoSangre)), "Sin Definir") as TipoSangre, 
		   COALESCE((select ObtenerNombreGenero(fkidGenero)), "Sin Definir") as Genero, COALESCE(u.telefonoFijo, "Sin Definir") as TelefonoFijo, COALESCE(u.direccion, "Sin Definir") as Direccion, 
           COALESCE(u.telefonoCelular, "Sin Definir") as TelefonoCelular, COALESCE(u.correo, "Sin Definir") as Correo, COALESCE((select ObtenerNombreSede(d.fkidSede)), "Sin Definir") as Sede,
           COALESCE(d.horasLaboralesSemanales, "Sin Definir") as HorasTrabajo, COALESCE((select ObtenerNombreDiscapacidad(u.fkidDiscapacidad)), "Sin Definir") as Discapacidad,
           COALESCE((select ObtenerNombreSisben(u.fkidSisben)), "Sin Definir") as Sisben, COALESCE((select ObtenerNombreEstrato(u.fkidEstrato)), "Sin Definir") as Estrato,
           COALESCE((select ObtenerNombreEPS(u.fkidEPS)), "Sin Definir") as EPS		   
	From Sede as s
    inner join Docente as d on d.fkidSede = s.idSede 
    inner join Usuario as u on d.fkidentificacion = u.identificacion
    where s.nombreSede = sedeRef;
END$$

/*--------------------------Obtener Informacion Docentes Sede Grado-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerInfoDocentesSedeGrado` $$
create procedure `ObtenerInfoDocentesSedeGrado`(
	sedeRef varchar(400),
    nomGrado varchar(400)
) 
begin                  
                   
    SELECT distinct d.idDocente as IdDocente,
		   CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ' '), 
		   COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, ' ')) 
		   COLLATE utf8mb4_unicode_ci as Docente,
		   u.identificacion as Identificacion, COALESCE((select ObtenerNombreTipoSangre(fkidTipoSangre)), "Sin Definir") as TipoSangre, 
		   COALESCE((select ObtenerNombreGenero(fkidGenero)), "Sin Definir") as Genero, COALESCE(u.telefonoFijo, "Sin Definir") as TelefonoFijo, COALESCE(u.direccion, "Sin Definir") as Direccion, 
           COALESCE(u.telefonoCelular, "Sin Definir") as TelefonoCelular, COALESCE(u.correo, "Sin Definir") as Correo, COALESCE((select ObtenerNombreSede(d.fkidSede)), "Sin Definir") as Sede,
            COALESCE(d.horasLaboralesSemanales, "Sin Definir") as HorasTrabajo, COALESCE((select ObtenerNombreDiscapacidad(u.fkidDiscapacidad)), "Sin Definir") as Discapacidad,
           COALESCE((select ObtenerNombreSisben(u.fkidSisben)), "Sin Definir") as Sisben, COALESCE((select ObtenerNombreEstrato(u.fkidEstrato)), "Sin Definir") as Estrato,
           COALESCE((select ObtenerNombreEPS(u.fkidEPS)), "Sin Definir") as EPS			   	  
    from Usuario as u 
    inner join Docente as d on d.fkidentificacion = u.identificacion
    inner join Sede as s on d.fkidSede = s.idSede
    inner join SedeGrados as sg on sg.fkidSede = s.idSede
    inner join Grados as g on sg.fkidGrado = g.idGrado
    left join DocentesGrado as dg on dg.fkidGrado = g.idGrado 
    where s.nombreSede = sedeRef and g.nombreGrado = nomGrado and dg.fkidDocente = d.idDocente;
END$$

/*--------------------------Obtener Informacion Todos los Docentes-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerInfoDocentesTodos` $$
create procedure `ObtenerInfoDocentesTodos`() 
begin                   
    SELECT d.idDocente as IdDocente,
		   CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
		   COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, '')) 
		   COLLATE utf8mb4_unicode_ci as Docente,
		   u.identificacion as Identificacion, COALESCE((select ObtenerNombreTipoSangre(fkidTipoSangre)), "Sin Definir") as TipoSangre, 
		   COALESCE((select ObtenerNombreGenero(fkidGenero)), "Sin Definir") as Genero, COALESCE(u.telefonoFijo, "Sin Definir") as TelefonoFijo, COALESCE(u.direccion, "Sin Definir") as Direccion, 
           COALESCE(u.telefonoCelular, "Sin Definir") as TelefonoCelular, COALESCE(u.correo, "Sin Definir") as Correo, COALESCE((select ObtenerNombreSede(d.fkidSede)), "Sin Definir") as Sede,
           d.horasLaboralesSemanales as HorasTrabajo, COALESCE((select ObtenerNombreDiscapacidad(u.fkidDiscapacidad)), "Sin Definir") as Discapacidad,
           COALESCE((select ObtenerNombreSisben(u.fkidSisben)), "Sin Definir") as Sisben, COALESCE((select ObtenerNombreEstrato(u.fkidEstrato)), "Sin Definir") as Estrato,
           COALESCE((select ObtenerNombreEPS(u.fkidEPS)), "Sin Definir") as EPS				   
	From Docente as d  
    inner join Usuario as u on d.fkidentificacion = u.identificacion;
END$$

/*--------------------------Obtener Informacion Docentes Vista Asignacion Grados-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerInfoGradosAsignaturasDocentes` $$
create procedure `ObtenerInfoGradosAsignaturasDocentes`(identificadorDocente int) 
begin                   
    SELECT CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
		   COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, '')) 
		   COLLATE utf8mb4_unicode_ci as Docente,
		   u.identificacion as Identificacion, COALESCE((select ObtenerNombreSede(d.fkidSede)), "Sin Definir") as Sede			   
	From Docente as d  
    inner join Usuario as u on d.fkidentificacion = u.identificacion
    where d.idDocente = identificadorDocente;
END$$

/*--------------------------Obtener Asignaturas del Docente-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerGradosAsignaturasDocentes` $$
create procedure `ObtenerGradosAsignaturasDocentes`(identificadorDocente int) 
begin                   
    SELECT distinct a.nombreAsignatura as Asignatura, g.nombreGrado as Grado		   
	From Docente as d  
    inner join DocenteAsignatura as da on da.fkidDocente = d.idDocente
    inner join Asignatura as a on da.fkidAsignatura = a.idAsignatura
    inner join AsignaturaGradoGrupo as agg on agg.fkidAsignatura = a.idAsignatura
    inner join GradoGrupo as gg on agg.fkidGradoGrupo = gg.idGradoGrupo
    inner join Grados as g on gg.fkidGrado = g.idGrado
    inner join DocentesGrado as dg on dg.fkidGrado = g.idGrado
    where dg.fkidDocente = d.idDocente and d.idDocente = identificadorDocente
    ORDER BY Grado Asc;
END$$

/*--------------------------Obtener Informacion Docentes Vista Asignacion Grados-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `GradosAsignaturasDocentes` $$
CREATE PROCEDURE `GradosAsignaturasDocentes`(sedeRef VARCHAR(400), GradoRef VARCHAR(400), nomAsignatura VARCHAR(400)) 
BEGIN
	Declare idGradoRef int;
    set idGradoRef = (select ObtenerIdGrado(GradoRef));
	
    SELECT subconsulta1.Documento, subconsulta1.NombreDocente
    FROM (
        -- Subconsulta 1
        SELECT DISTINCT u.identificacion as Documento, (CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
                                    COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, ''))) AS NombreDocente
        FROM Asignatura AS a
        INNER JOIN DocenteAsignatura AS da ON da.fkidAsignatura = a.idAsignatura
        INNER JOIN Docente AS d ON da.fkidDocente = d.idDocente
        INNER JOIN Usuario AS u ON d.fkidentificacion = u.identificacion
        WHERE a.nombreAsignatura = nomAsignatura
    ) AS subconsulta1
    INNER JOIN (
        -- Subconsulta 2
        SELECT DISTINCT u.identificacion as Documento, (CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
                                    COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, ''))) AS NombreDocente
        FROM Sede AS s
        INNER JOIN SedeGrados AS sg ON sg.fkidSede = s.idSede
        INNER JOIN Grados AS g ON sg.fkidGrado = idGrado
        INNER JOIN DocentesGrado AS dg ON dg.fkidGrado = g.idGrado
        INNER JOIN Docente AS d ON dg.fkidDocente = d.idDocente
        INNER JOIN Usuario AS u ON d.fkidentificacion = u.identificacion
        WHERE s.nombreSede = sedeRef AND g.idGrado = idGradoRef
    ) AS subconsulta2 ON subconsulta1.NombreDocente = subconsulta2.NombreDocente;
END$$
DELIMITER ;

/*--------------------------Obtener Informacion Docentes Vista Asignacion Grados-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `GradosGruposAsignaturasDocentes` $$
CREATE PROCEDURE `GradosGruposAsignaturasDocentes`(sedeRef VARCHAR(400), GradoRef VARCHAR(400), GrupoRef VARCHAR(400)) 
BEGIN
	Declare idGradoRef int;
    set idGradoRef = (select ObtenerIdGrado(GradoRef));
	
    SELECT subconsulta1.Asignatura, subconsulta1.NombreDocente, subconsulta1.Documento
    FROM (
        -- Subconsulta 1
        SELECT DISTINCT u.identificacion as Documento, (CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
                                    COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, ''))) AS NombreDocente,
						a.nombreAsignatura AS Asignatura
        FROM GradoGrupo as gg
        INNER JOIN AsignaturaGradoGrupo AS agg ON agg.fkidGradoGrupo = gg.idGradoGrupo
        INNER JOIN Asignatura AS a ON agg.fkIdAsignatura = a.idAsignatura
        INNER JOIN DocenteAsignatura AS da ON da.fkidAsignatura = a.idAsignatura
        INNER JOIN Docente AS d ON da.fkidDocente = d.idDocente
        INNER JOIN Usuario AS u ON d.fkidentificacion = u.identificacion
        WHERE gg.grupoGrado = GrupoRef
    ) AS subconsulta1
    INNER JOIN (
        -- Subconsulta 2
        SELECT DISTINCT u.identificacion as Documento, (CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
                                    COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, ''))) AS NombreDocente
        FROM Sede AS s
        INNER JOIN SedeGrados AS sg ON sg.fkidSede = s.idSede
        INNER JOIN Grados AS g ON sg.fkidGrado = idGrado
        INNER JOIN DocentesGrado AS dg ON dg.fkidGrado = g.idGrado
        INNER JOIN Docente AS d ON dg.fkidDocente = d.idDocente
        INNER JOIN Usuario AS u ON d.fkidentificacion = u.identificacion
        WHERE s.nombreSede = sedeRef AND g.idGrado = idGradoRef
    ) AS subconsulta2 ON subconsulta1.NombreDocente = subconsulta2.NombreDocente;
END$$
DELIMITER ;

/*--------------------------Obtener Asignaturas Del Docente-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `AsignaturasDelDocente` $$
CREATE PROCEDURE `AsignaturasDelDocente`(sedeRef VARCHAR(400), GradoRef VARCHAR(400), identificacionDocente BigInt) 
BEGIN
	Declare idGradoRef int;
    Set idGradoRef = (select ObtenerIdGrado(GradoRef));
	
    SELECT subconsulta1.IdentificadorAsignatura, subconsulta1.Asignatura
    FROM (
        -- Subconsulta 1
        SELECT DISTINCT a.idAsignatura as IdentificadorAsignatura, a.nombreAsignatura as Asignatura
        FROM Sede as s
        inner join Docente as d on d.fkidSede = s.idSede
        inner join DocenteAsignatura as da on da.fkidDocente = d.idDocente
        inner join Asignatura as a on da.fkidAsignatura = a.idAsignatura
        where s.nombreSede = sedeRef and d.fkidentificacion = identificacionDocente
    ) AS subconsulta1
    INNER JOIN (
        -- Subconsulta 2
        SELECT DISTINCT a.idAsignatura as IdentificadorAsignatura, a.nombreAsignatura as Asignatura
        FROM Sede as s
        inner join Docente as d on d.fkidSede = s.idSede
        inner join DocentesGrado as dg on dg.fkidDocente = d.idDocente
        inner join Grados as g on dg.fkidGrado = g.idGrado
        inner join SedeGrados as sg on sg.fkidGrado = g.idGrado and sg.fkidSede = s.idSede
        left join GradoGrupo as gg on gg.fkidGrado = g.idGrado
        inner join AsignaturaGradoGrupo as agg on agg.fkidGradoGrupo = gg.idGradoGrupo
        inner join Asignatura as a on agg.fkidAsignatura = a.idAsignatura
    ) AS subconsulta2 ON subconsulta1.IdentificadorAsignatura = subconsulta2.IdentificadorAsignatura;
END$$
DELIMITER ;

/*--------------------------Obtener Asignaturas del Grado-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerAsignaturasGrado` $$
create procedure `ObtenerAsignaturasGrado`(sedeRef varchar(400), idGradoRef int) 
begin    
    SELECT a.nombreAsignatura as Asignatura		   
	From Sede as s
    inner join SedeGrados as sg on sg.fkidSede = s.idSede
    inner join Grados as g on sg.fkidGrado = g.idGrado and g.idGrado = idGradoRef
    inner join GradoGrupo as gg on gg.fkidGrado = g.idGrado
	inner join asignaturaGradoGrupo as agg on agg.fkidGradoGrupo = gg.idGradoGrupo
	inner join Asignatura as a on agg.fkidAsignatura = a.idAsignatura
    where s.nombreSede = sedeRef;
END$$

/*--------------------------Obtener Grupos del Docente -------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerDocenteGrupos` $$
create procedure `ObtenerDocenteGrupos`(sedeRef varchar(400), GradoRef varchar(400), documentoDocente bigint) 
begin
	declare idGradoSede int;
    set idGradoSede = (select distinct g.idGrado from Sede as s
					   inner join SedeGrados as sg on sg.fkidSede = s.idSede
                       inner join Grados as g on sg.fkidGrado = g.idGrado
                       where s.nombreSede = sedeRef and g.nombreGrado = GradoRef);
    
    SELECT distinct gg.idGradoGrupo as IdentificadorGrupo, gg.grupoGrado as Grupo	
    From Docente as d 
    inner join DocentesGrado as dg on dg.fkidDocente = d.idDocente
    inner join Grados as g on dg.fkidGrado = g.idGrado
    inner join GradoGrupo as gg on gg.fkidGrado = g.idGrado
    where d.fkidentificacion = documentoDocente and g.nombreGrado = GradoRef and g.idGrado = idGradoSede;

END$$

/*--------------------------Obtener Grupos del Docente -------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerDocenteGrados` $$
create procedure `ObtenerDocenteGrados`(sedeRef varchar(400), documentoDocente bigint) 
begin
    SELECT distinct g.idGrado as IdentificadorGrado, g.nombreGrado as Grado		   
	From Sede as s
    inner join Docente as d on d.fkidSede = s.idSede
    inner join DocentesGrado as dg on dg.fkidDocente = d.idDocente
    inner join Grados as g on dg.fkidGrado = g.idGrado
    inner join SedeGrados as sg on sg.fkidGrado = g.idGrado
    where s.nombreSede = sedeRef and d.fkidentificacion = documentoDocente and sg.fkidSede = s.idSede;
END$$

/*--------------------------Registrar Docente Asignatura y Grupo de Grado-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `RegistrarAsignaturaGrupoDocente` $$
create procedure `RegistrarAsignaturaGrupoDocente`(idDocenteRef varchar(400), idGradoRef int, asignaturaRef varchar(400)) 
begin
	declare nombreDocente varchar(400);
    declare identificadorDocente int;
	declare nombreAsignatura varchar(400);
    declare grado int;
    /*(select ObtenerIdDocente(CAST(identificacion AS SIGNED))*/
    set nombreDocente = (SELECT (CONCAT(COALESCE(Usuario.primerNombreUsuario, ''), ' ', COALESCE(Usuario.segundoNombreUsuario, ''), 
						 COALESCE(Usuario.primerApellidoUsuario, ''), ' ', COALESCE(Usuario.segundoApellidoUsuario, '')))
						 FROM Docente 
						 inner join Usuario on Docente.fkidentificacion = Usuario.identificacion
						 where Docente.idDocente = (CAST(idDocenteRef AS SIGNED)));
    set identificadorDocente = (select d.idDocente from Docente as d 
								where d.idDocente = (CAST(idDocenteRef AS SIGNED)));
    set nombreAsignatura = (select a.nombreAsignatura from Asignatura as a 
						    where a.nombreAsignatura = asignaturaRef);
    set grado = (select g.idGrado from Grados as g 
				 where g.idGrado = idGradoRef);
    
    if ((FunExisteDocenteAsignaturaGrado(identificadorDocente, nombreAsignatura, grado)) = 0) then
		call registrarDocenteAsignatura(nombreDocente, nombreAsignatura);
		insert DocentesGrado (estadoDocenteGrado, fkidDocente, fkidGrado) value ("Activo", identificadorDocente, grado);
		select 1;
	ELSE
		select 0;
	end if;
END$$

/*--------------------------Obtener Periodos-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerPeriodos` $$
create procedure `ObtenerPeriodos`() 
begin
    SELECT p.idPeriodoAcademico as IdPeriodo, p.periodoAcademico as Periodo		   
	From PeriodoAcademico as p;
END$$

/*--------------------------Registrar Docente Notas e Inasistencia-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarDocenteNotasAsistenciasPeriodo` $$
create procedure `registrarDocenteNotasAsistenciasPeriodo`(
    asignatura varchar(400),
    docEstudiante int,
    PeriodoNota varchar(400),
    nota float,
    nFallasRef int
) 
begin
	DECLARE idEstudiante int;
	DECLARE idNotafinal int;
    DECLARE idPeriodoNota int;
    DECLARE posicionRecuperada int;
    DECLARE notaRecuperada float;
    DECLARE IdNotaRef int;
    DECLARE IdNotaEstudianteRef int;
    DECLARE IdAsisnteciaEstudianteRef int;
    DECLARE idNotaGeneral int;
    
    set idEstudiante = DocEstudiante;
    set idPeriodoNota = (select obtenerIdPeriodo(PeriodoNota));
    set IdNotaEstudianteRef = (select obtenerIdNotaEstudianteAsignatura(idEstudiante, asignatura, PeriodoNota));
    set IdAsisnteciaEstudianteRef = (select obtenerIdAsistenciaEstudianteAsignatura(idEstudiante, asignatura, PeriodoNota));
    set idNotaGeneral = (select ndp.idNotas from NotaDefinitivaPeriodo as ndp
						 where fkidNotaEstudiante = IdNotaEstudianteRef and fkidAsignatura = (select ObtenerIdAsignatura(asignatura))
                         and fkidPeriodoAcademico = idPeriodoNota);
    
    if (select FunexisteNotasEstudianteAsignatura(idEstudiante, asignatura, PeriodoNota) > 0) then
    
		update NotasEstudiante set notaDefinitiva = nota
		where idNotaEstudiante = IdNotaEstudianteRef;
        
        update AsistenciaEstudiante set nFallas = nFallasRef
		where idAsistenciaGradoGrupo = IdAsisnteciaEstudianteRef;
		
        update NotaDefinitivaPeriodo set notaGeneral = nota
        where idNotas = idNotaGeneral;
	else 
		if(select FunexisteNotasEstudianteAsignatura(idEstudiante, asignatura, PeriodoNota) = 0) then
        
			insert into NotasEstudiante (estadoNota, notaDefinitiva, fkidEstudiante, puestoNota) 
			value ("Cargada", nota, idEstudiante, 0);
			
			insert into NotaDefinitivaPeriodo (notaGeneral, estadoNota, puestoNota, fkidPeriodoAcademico, fkidAsignatura, fkidNotaFinal, fkidNotaEstudiante) 
			value ((select obtenerNotaEstudiante(idEstudiante)), "Cargada", 0, idPeriodoNota, (select ObtenerIdAsignatura(asignatura)), null, (select obtenerIdNotasEstudiante(idEstudiante)) );

			insert Asistencia (estadoAsistencia, fkidAsignatura, fkidPeriodoAcademico) 
			value ("Por definir", (select ObtenerIdAsignatura(asignatura)), idPeriodoNota);
			
			insert AsistenciaEstudiante (estadoAsistencia, nFallas, fkidAsistencia, fkidEstudiante) 
			value ("Activa", nFallasRef, (select obtenerIdAsistenciaAsignaturaPeriodo(PeriodoNota, asignatura)), idEstudiante);
            
        end if;
	end if;	
    
END$$

/*------Registrar Posicionamiento Estudiantes Grupo-----*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerNotasInasistenciasEstudiantesXGrupo` $$
CREATE PROCEDURE `ObtenerNotasInasistenciasEstudiantesXGrupo`(idEstudianteRef int, asignaturaRef varchar(400), periodoRef varchar(400)) 
BEGIN    
    SELECT subconsulta1.IdentificadorEstudiante, subconsulta1.Fallas, subconsulta1.Asignatura, subconsulta2.NotaPeriodo,
    subconsulta2.PuestoGrupo
    FROM (
        -- Subconsulta 1
        SELECT DISTINCT e.idEstudiante AS IdentificadorEstudiante, ae.nFallas AS Fallas, asig.nombreAsignatura AS Asignatura
        From Estudiante AS e
        INNER JOIN AsistenciaEstudiante AS ae ON ae.fkidEstudiante = e.idEstudiante
        INNER JOIN Asistencia AS asis ON ae.fkidAsistencia = asis.idAsistencia
        INNER JOIN Asignatura AS asig ON asis.fkidAsignatura = asig.idAsignatura
        WHERE asis.fkidPeriodoAcademico = (select obtenerIdPeriodo(periodoRef)) AND asig.nombreAsignatura = asignaturaRef
        AND e.idEstudiante = idEstudianteRef
    ) AS subconsulta1
    INNER JOIN (
        -- Subconsulta 2
        SELECT DISTINCT e.idEstudiante AS IdentificadorEstudiante2, ndp.notaGeneral AS NotaPeriodo, ne.puestoNota AS PuestoGrupo,
        asig.nombreAsignatura AS Asignatura2
        From Estudiante AS e
        INNER JOIN NotasEstudiante AS ne ON ne.fkidEstudiante =  e.idEstudiante
        INNER JOIN NotaDefinitivaPeriodo AS ndp ON ndp.fkidNotaEstudiante = ne.idNotaEstudiante
        INNER JOIN Asignatura AS asig ON ndp.fkidAsignatura = asig.idAsignatura
        WHERE ndp.fkidPeriodoAcademico = (select obtenerIdPeriodo(periodoRef)) AND asig.nombreAsignatura = asignaturaRef
        AND e.idEstudiante = idEstudianteRef
    ) AS subconsulta2 ON subconsulta1.IdentificadorEstudiante = subconsulta2.IdentificadorEstudiante2 AND
		subconsulta1.Asignatura = subconsulta2.Asignatura2;    
END$$
DELIMITER ;

/*------Registrar Posicionamiento Estudiantes Grupo-----*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerNotasInasistenciasEstudiantesTodosXGrupo` $$
CREATE PROCEDURE `ObtenerNotasInasistenciasEstudiantesTodosXGrupo`(GrupoRef varchar(400), asignaturaRef varchar(400), periodoRef varchar(400)) 
BEGIN 
	DECLARE idGrupoRef int;
    SET idGrupoRef = (SELECT ObtenerIdGradoGrupo(GrupoRef));
    
    SELECT subconsulta3.NombreEstudiante ,subconsulta1.IdentificadorEstudiante, subconsulta1.Fallas, subconsulta2.NotaPeriodo
    FROM (
        -- Subconsulta 1
        SELECT DISTINCT ae.fkidEstudiante AS IdentificadorEstudiante, ae.nFallas AS Fallas, 
        (select ObtenerNombreEstudiante(ae.fkidEstudiante)) AS NombreEstudiante
		FROM GradoGrupo AS gg 
		INNER JOIN AsignaturaGradoGrupo AS ag ON gg.idGradoGrupo = ag.fkidGradoGrupo
		INNER JOIN Asignatura AS asig ON ag.fkidAsignatura = asig.idAsignatura
		INNER JOIN Asistencia AS asis ON asig.idAsignatura = asis.fkidAsignatura
		INNER JOIN AsistenciaEstudiante AS ae ON asis.idAsistencia = ae.fkidAsistencia
		INNER JOIN Estudiante AS e ON ae.fkidEstudiante = e.idEstudiante
		INNER JOIN EstudiantesGradoGrupo AS egg ON e.idEstudiante =  egg.fkidEstudiante 
		WHERE gg.idGradoGrupo = idGrupoRef
		AND asis.fkidPeriodoAcademico = (SELECT obtenerIdPeriodo(periodoRef)) AND asig.nombreAsignatura = asignaturaRef
    ) AS subconsulta1
    INNER JOIN (
        -- Subconsulta 2
        SELECT DISTINCT ne.fkidEstudiante AS IdentificadorEstudiante2, ndp.notaGeneral AS NotaPeriodo
		FROM GradoGrupo AS gg 
		INNER JOIN AsignaturaGradoGrupo AS ag ON gg.idGradoGrupo = ag.fkidGradoGrupo
		INNER JOIN Asignatura AS asig ON ag.fkidAsignatura = asig.idAsignatura
		INNER JOIN NotaDefinitivaPeriodo AS ndp ON asig.idAsignatura = ndp.fkidAsignatura
		INNER JOIN NotasEstudiante AS ne ON ndp.fkidNotaEstudiante = ne.idNotaEstudiante
		INNER JOIN Estudiante AS e ON ne.fkidEstudiante = e.idEstudiante
		INNER JOIN EstudiantesGradoGrupo AS egg ON e.idEstudiante = egg.fkidEstudiante
		WHERE gg.idGradoGrupo = egg.fkidGradoGrupo AND gg.idGradoGrupo = idGrupoRef
		AND ndp.fkidPeriodoAcademico = (SELECT obtenerIdPeriodo(periodoRef)) AND asig.nombreAsignatura = asignaturaRef       
    ) AS subconsulta2 
    INNER JOIN (
		-- Subconsulta 3
        SELECT ObtenerNombreEstudiante(e.idEstudiante) AS NombreEstudiante, e.idEstudiante AS IdentificadorEstudiante3
        FROM Estudiante AS e
        INNER JOIN EstudiantesGradoGrupo AS egg ON egg.fkidEstudiante = e.idEstudiante
        INNER JOIN GradoGrupo AS gg ON egg.fkidGradoGrupo = gg.idGradoGrupo
        WHERE gg.idGradoGrupo = idGrupoRef
    ) AS subconsulta3 ON subconsulta1.IdentificadorEstudiante = subconsulta2.IdentificadorEstudiante2;  
END$$
DELIMITER ;

DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerNotasInasistenciasEstudiantesTodosXGrupo2` $$
CREATE PROCEDURE `ObtenerNotasInasistenciasEstudiantesTodosXGrupo2`(GrupoRef VARCHAR(400), asignaturaRef VARCHAR(400), periodoRef VARCHAR(400)) 
BEGIN 
    DECLARE idGrupoRef INT;
    SET idGrupoRef = (SELECT ObtenerIdGradoGrupo(GrupoRef));
    
    SELECT 
        COALESCE(subconsulta3.NombreEstudiante, 'Sin Nombre') AS NombreEstudiante, 
        COALESCE(subconsulta3.IdentificadorEstudiante, 0) AS IdentificadorEstudiante, 
        COALESCE(subconsulta1.Fallas, 0) AS Fallas, 
        COALESCE(subconsulta2.NotaPeriodo, 0) AS NotaPeriodo
    FROM (
        -- Subconsulta 1
        SELECT DISTINCT ae.fkidEstudiante AS IdentificadorEstudiante, ae.nFallas AS Fallas
        FROM GradoGrupo AS gg 
        INNER JOIN AsignaturaGradoGrupo AS ag ON gg.idGradoGrupo = ag.fkidGradoGrupo
        INNER JOIN Asignatura AS asig ON ag.fkidAsignatura = asig.idAsignatura
        INNER JOIN Asistencia AS asis ON asig.idAsignatura = asis.fkidAsignatura
        INNER JOIN AsistenciaEstudiante AS ae ON asis.idAsistencia = ae.fkidAsistencia
        INNER JOIN Estudiante AS e ON ae.fkidEstudiante = e.idEstudiante
        INNER JOIN EstudiantesGradoGrupo AS egg ON e.idEstudiante = egg.fkidEstudiante 
        WHERE gg.idGradoGrupo = idGrupoRef
        AND asis.fkidPeriodoAcademico = (SELECT obtenerIdPeriodo(periodoRef)) AND asig.nombreAsignatura = asignaturaRef
    ) AS subconsulta1
    INNER JOIN (
        -- Subconsulta 2
        SELECT DISTINCT ne.fkidEstudiante AS IdentificadorEstudiante, ndp.notaGeneral AS NotaPeriodo
        FROM GradoGrupo AS gg 
        INNER JOIN AsignaturaGradoGrupo AS ag ON gg.idGradoGrupo = ag.fkidGradoGrupo
        INNER JOIN Asignatura AS asig ON ag.fkidAsignatura = asig.idAsignatura
        INNER JOIN NotaDefinitivaPeriodo AS ndp ON asig.idAsignatura = ndp.fkidAsignatura
        INNER JOIN NotasEstudiante AS ne ON ndp.fkidNotaEstudiante = ne.idNotaEstudiante
        INNER JOIN Estudiante AS e ON ne.fkidEstudiante = e.idEstudiante
        INNER JOIN EstudiantesGradoGrupo AS egg ON e.idEstudiante = egg.fkidEstudiante
        WHERE gg.idGradoGrupo = idGrupoRef
        AND ndp.fkidPeriodoAcademico = (SELECT obtenerIdPeriodo(periodoRef)) AND asig.nombreAsignatura = asignaturaRef       
    ) AS subconsulta2 ON subconsulta1.IdentificadorEstudiante = subconsulta2.IdentificadorEstudiante
    RIGHT JOIN (
        -- Subconsulta 3
        SELECT ObtenerNombreEstudiante(e.idEstudiante) AS NombreEstudiante, e.idEstudiante AS IdentificadorEstudiante
        FROM Estudiante AS e
        INNER JOIN EstudiantesGradoGrupo AS egg ON egg.fkidEstudiante = e.idEstudiante
        WHERE egg.fkidGradoGrupo = idGrupoRef
    ) AS subconsulta3 ON subconsulta1.IdentificadorEstudiante = subconsulta3.IdentificadorEstudiante;  
END$$

DELIMITER ;


/*--------------------------Registrar Nota Año Academico-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `NotaAnnoAcademico` $$
create procedure `NotaAnnoAcademico`(
    calificacionAño float
) 
begin
	declare periodos int;
	set periodos = (select count(*) as RegistroPeriodos from PeriodoAcademico);
    
	if (((FunexisteNotaFinal()) = 0) and periodos = 4) then
		insert into NotaFinal (añoElectivo, calificacionAño, estadoCalificacionAño) 
        value ((SELECT YEAR(NOW())), calificacionAño, "Finalizada");
    end if;
END$$

/*--------------------------Obtener Notas y Fallas del Estudiante -------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerNotasFallasEstudiante` $$
create procedure `ObtenerNotasFallasEstudiante`(documentoEstudiante bigint, asignaturaRef varchar(400), periodoRef varchar(400)) 
begin    
    
	SELECT subconsulta1.Identificacion, subconsulta1.Estudiante, subconsulta2.Nota, subconsulta1.Fallas
	FROM (
		-- Subconsulta 1
		SELECT DISTINCT e.Usuario_identificacion as Identificacion,
						(SELECT (CONCAT(COALESCE(Usuario.primerNombreUsuario, ''), ' ', COALESCE(Usuario.segundoNombreUsuario, ''), 
						COALESCE(Usuario.primerApellidoUsuario, ''), ' ', COALESCE(Usuario.segundoApellidoUsuario, '')))) as Estudiante,
						a.nFallas as Fallas
		From Usuario as u
		inner join Estudiante as e on e.Usuario_identificacion = u.identificacion
        inner join AsistenciaEstudiante as ae on ae.fkidEstudiante = e.idEstudiante
        inner join Asistencia as a on ae.fkidAsistencia = a.idAsistencia
        inner join Asignatura as asig on a.fkidAsignatura = asig.idAsignatura
        left join PeriodoAcademico as pa on ae.fkidPeriodoAcademico = pa.idPeriodoAcademico
        where u.identificacion = documentoEstudiante and asig.nombreAsignatura = asignaturaRef and 	pa.periodoAcademico = periodoRef
    ) AS subconsulta1
    INNER JOIN (
        -- Subconsulta 2
        SELECT DISTINCT e.Usuario_identificacion as Identificacion, ndp.notaDefinitiva as Nota
        From Usuario as u
		inner join Estudiante as e on e.Usuario_identificacion = u.identificacion
        inner join NotasEstudiante as ne on ne.fkidEstudiante = e.idEstudiante
        inner join NotaDefinitivaPeriodo as ndp on ne.fkidNotaDefinitivaPeriodo = ndp.idNotas
        inner join PeriodoAcademico as pa on ndp.fkidPeriodoAcademico = pa.idPeriodoAcademico
        where u.identificacion = documentoEstudiante and pa.periodoAcademico = periodoRef
    ) AS subconsulta2 ON subconsulta1.Identificacion = subconsulta2.Identificacion;

END$$

/*--------------------------Obtener Notas Estudiantes -------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerNotasEstudiantesXMateria` $$
create procedure `ObtenerNotasEstudiantesXMateria`(asignaturaRef varchar(400), periodoRef varchar(400)) 
begin    
		SELECT DISTINCT e.Usuario_identificacion as Identificacion, ndp.notaDefinitiva as Nota
        From Usuario as u
		inner join Estudiante as e on e.Usuario_identificacion = u.identificacion
        inner join NotasEstudiante as ne on ne.fkidEstudiante = e.idEstudiante
        inner join NotaDefinitivaPeriodo as ndp on ne.fkidNotaDefinitivaPeriodo = ndp.idNotas
        inner join PeriodoAcademico as pa on ndp.fkidPeriodoAcademico = pa.idPeriodoAcademico
        where u.identificacion = documentoEstudiante and pa.periodoAcademico = periodoRef;

END$$


/*--------------------------Obtener Notas Estudiantes -------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerSumaNotasEstudiantes` $$
create procedure `ObtenerSumaNotasEstudiantes`(idEstudianteRef int, periodoRef varchar(400), grupoRef varchar(400)) 
begin    
		declare sumaNotasEstudiante float;
        declare numeroNotas int;
        
        set sumaNotasEstudiante = (SELECT SUM(ndp.notaGeneral) as Nota
									From Estudiante as e 
									inner join NotasEstudiante as ne on ne.fkidEstudiante = e.idEstudiante
									inner join NotaDefinitivaPeriodo as ndp on ndp.fkidNotaEstudiante = ne.idNotaEstudiante
									inner join PeriodoAcademico as pa on ndp.fkidPeriodoAcademico = pa.idPeriodoAcademico
									where e.IdEstudiante = idEstudianteRef and pa.periodoAcademico = periodoRef
                                    );
		set numeroNotas = (SELECT COUNT(a.NombreAsignatura) as NAsignaturas
							From Asignatura as a
                            inner join AsignaturaGradoGrupo as agg on agg.fkidAsignatura = a.idAsignatura
                            inner join GradoGrupo as gg on agg.fkidGradoGrupo = gg.idGradoGrupo
                            where gg.grupoGrado = grupoRef
                            );
		select idEstudianteRef as idEstudiante, sumaNotasEstudiante / numeroNotas as Promedio;
END$$

/*--------------------------Obtener Notas Estudiantes -------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerNotasEstudiantesXMateria` $$
create procedure `ObtenerNotasEstudiantesXMateria`(documentoEstudiante bigint, asignaturaRef varchar(400), periodoRef varchar(400)) 
begin    
		SELECT DISTINCT ndp.notaGeneral as Nota
        From Usuario as u
		inner join Estudiante as e on e.Usuario_identificacion = u.identificacion
        inner join NotasEstudiante as ne on ne.fkidEstudiante = e.idEstudiante
        inner join NotaDefinitivaPeriodo as ndp on ndp.fkidNotaEstudiante = ne.idNotaEstudiante
        inner join PeriodoAcademico as pa on ndp.fkidPeriodoAcademico = pa.idPeriodoAcademico
        left join Asignatura as a on ndp.fkidAsignatura = a.idAsignatura
        where u.identificacion = documentoEstudiante and pa.periodoAcademico = periodoRef and a.nombreAsignatura = asignaturaRef;

END$$

/*--------------------------Obtener Periodo Habilitado -------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerPeriodoHabilitado` $$
create procedure `ObtenerPeriodoHabilitado`() 
begin    
		SELECT DISTINCT p.PeriodoAcademico as Periodo
        From PeriodoAcademico AS p
        WHERE p.estadoPeriodo = "Habilitado";
END$$

DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerPeriodosTodos` $$
create procedure `ObtenerPeriodosTodos`() 
begin    
		SELECT DISTINCT p.PeriodoAcademico as Periodo
        From PeriodoAcademico AS p;
END$$


/*--------------------------Actualizar Posicion Estudiante -------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ActualizarPosicionEstudiantes` $$
create procedure `ActualizarPosicionEstudiantes`(idEstudianteRef bigint, puestoRef int, asignaturaRef varchar(400), periodoRef varchar(400)) 
begin   
		DECLARE idAsignatura INT;
        DECLARE idPeriodo INT;
        DECLARE idNotaEstudianteRef INT;
        DECLARE idPuestoCambio INT;
        DECLARE IdEstudiante INT;
        
        SET IdEstudiante = (SELECT e.idEstudiante FROM Estudiante AS e WHERE e.Usuario_identificacion = idEstudianteRef);
        SET idAsignatura = (SELECT a.IdAsignatura FROM Asignatura AS a WHERE a.nombreAsignatura = asignaturaRef);
        SET idPeriodo = (SELECT p.idPeriodoAcademico FROM PeriodoAcademico AS p WHERE p.periodoAcademico = periodoRef);
        SET idNotaEstudianteRef = (SELECT ne.idNotaEstudiante 
									FROM NotaDefinitivaPeriodo AS ndp
									INNER JOIN NotasEstudiante AS ne ON ndp.fkidNotaEstudiante = ne.idNotaEstudiante
									WHERE ndp.fkidAsignatura = idAsignatura AND ndp.fkidperiodoAcademico = idPeriodo
									AND ne.fkidEstudiante = IdEstudiante
                                    );
        SET idPuestoCambio = (SELECT ne.idNotaEstudiante FROM NotasEstudiante AS ne
							   WHERE ne.idNotaEstudiante = idNotaEstudianteRef);	
                               
		UPDATE NotasEstudiante SET puestoNota = puestoRef
        WHERE idNotaEstudiante = idPuestoCambio;
END$$

/*--------------------------Actualizar Estado Periodo -------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ActualizarEstadoPeriodo` $$
create procedure `ActualizarEstadoPeriodo`(esActivado int, periodo varchar(400)) 
begin    
		declare idRef int;
        set idRef = (select distinct PeriodoAcademico.idPeriodoAcademico from PeriodoAcademico where PeriodoAcademico.periodoAcademico = periodo);
			
		if (esActivado = 1) then
			UPDATE PeriodoAcademico SET estadoPeriodo = "Habilitado"
			WHERE PeriodoAcademico.idPeriodoAcademico = idRef;
		elseif (esActivado = 0) then
			UPDATE PeriodoAcademico SET estadoPeriodo = "Deshabilitado"
			WHERE PeriodoAcademico.idPeriodoAcademico = idRef;
        end if;		
END$$

/*--------------------------Actualizar Titular Grupo -------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ActualizarDocentesTitularGrupo` $$
create procedure `ActualizarDocentesTitularGrupo`(idDocenteRef int, grupoRef varchar(400)) 
begin    
		declare idGradoGrupoRef int;        
		declare nombreDocente varchar(400);
        declare documento bigint;
        declare sedeDocente int;
        set sedeDocente = (select d.fkidSede from Docente as d where d.idDocente = idDocenteRef);
        
        set documento = (select d.fkidentificacion from Docente as d where d.idDocente = idDocenteRef);        
        set nombreDocente = (select ObtenerNombreCompletoDocente(documento));
        set idGradoGrupoRef = (select distinct gg.idGradoGrupo from GradoGrupo as gg
							   inner join Grados as g on gg.fkidGrado = g.idGrado
							   inner join SedeGrados as sg on sg.fkidGrado = g.idGrado
                               where gg.grupoGrado = grupoRef and sg.fkidSede = sedeDocente);
                               
        if ((select existeTitularGrupo(grupoRef)) != 0 ) then
			update GradoGrupo set nombreTitular = nombreDocente
			where idGradoGrupo = idGradoGrupoRef;            
        end if;		
END$$

/*--------------------------Obtener Titular Grupo -------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerDocentesTitularGrupo` $$
create procedure `ObtenerDocentesTitularGrupo`(idDocenteRef int) 
begin    
		declare idGradoGrupoRef int;        
		declare nombreDocente varchar(400);
        declare documento bigint;
        
        set documento = (select d.fkidentificacion from Docente as d where d.idDocente = idDocenteRef);
        set nombreDocente = (select ObtenerNombreCompletoDocente(documento));
        
		select g.nombreGrado, gg.grupoGrado as Grupo
        from GradoGrupo as gg
        inner join Grados as g on gg.fkidGrado = g.idGrado
        where gg.nombreTitular = nombreDocente;
END$$

/*--------------------------Obtener Titular Grupo -------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerGrupoSinTitular` $$
create procedure `ObtenerGrupoSinTitular`(idGradoRef int) 
begin         
		select gg.idGradoGrupo as IdentificadorGrupo, gg.grupoGrado as Grupo
        from GradoGrupo as gg
        inner join Grados as g on gg.fkidGrado = g.idGrado
        where gg.nombreTitular = "Por definir" and g.idGrado = idGradoRef;
END$$

DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerGrupoDelTitular` $$
create procedure `ObtenerGrupoDelTitular`(idDocenteRef bigint) 
begin   
        declare nombreDocente varchar(400);
        declare iddocenteGrado int;
        
        set nombreDocente = (select ObtenerNombreCompletoDocente(idDocenteRef));
        
		select g.nombreGrado as Grado, gg.idGradoGrupo as IdentificadorGrupo, gg.grupoGrado as Grupo
        from GradoGrupo as gg
        inner join Grados as g on gg.fkidGrado = g.idGrado
        where gg.nombreTitular = nombreDocente;
END$$

/*--------------------------Actualizar Titular Grupo -------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ActualizarNotaConvivencia` $$
create procedure `ActualizarNotaConvivencia`(idEstudiante bigint, periodo varchar(400), nota float, docDocente bigint, grupoRef varchar(400)) 
begin    
		declare idDocenteRef int;
		declare idGradoGrupoRef int;     
        declare documento bigint;
        declare sedeDocente int;
        declare Asignatura varchar(400);
        declare nombreDocente varchar(400);
        declare nFallas int;
        
        set idDocenteRef = (select d.idDocente from Docente as d where d.fkidentificacion = docDocente);
        set Asignatura = "Convivencia";
        set nFallas = 0;
        set sedeDocente = (select d.fkidSede from Docente as d where d.idDocente = idDocenteRef);        
        set documento = (select d.fkidentificacion from Docente as d where d.idDocente = idDocenteRef);
        set nombreDocente = (select ObtenerNombreCompletoDocente(documento));
        set idGradoGrupoRef = (select distinct gg.idGradoGrupo from GradoGrupo as gg
							   inner join Grados as g on gg.fkidGrado = g.idGrado
							   inner join SedeGrados as sg on sg.fkidGrado = g.idGrado
                               where gg.grupoGrado = grupoRef and sg.fkidSede = sedeDocente);
        
		call registrarDocenteNotasAsistenciasPeriodo(Asignatura, idEstudiante, periodo, nota, nFallas);
  
END$$
