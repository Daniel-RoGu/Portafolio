use bdColegio;

/*--------------------------Registrar Docente-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarDocente` $$
create procedure `registrarDocente`(
    horasTrabaja varchar(45),
    nomSede varchar(400),
    documento varchar(400),    
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
	insert into Docente (estadoDocente, horasLaboralesSemanales, fkidentificacion, fkidSede)
				value("Activo", horasTrabaja, (SELECT CAST(documento AS SIGNED)), (select ObtenerIdSede(nomSede)));
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

/*--------------------------Registrar Docente Asignatura-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarDocenteAsignatura` $$
create procedure `registrarDocenteAsignatura`(
    nombreDocente varchar(400),
    asignatura varchar(400)
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
    SELECT (CONCAT(COALESCE(Usuario.primerNombreUsuario, ''), ' ', COALESCE(Usuario.segundoNombreUsuario, ''), 
            COALESCE(Usuario.primerApellidoUsuario, ''), ' ', COALESCE(Usuario.segundoApellidoUsuario, ''))) AS Docente
    FROM Docente 
    INNER JOIN Usuario ON Docente.fkidentificacion = Usuario.identificacion;
END$$

/*--------------------------Obtener Estudiantes Grupo-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerEstudiantesGrupo` $$
create procedure `obtenerEstudiantesGrupo`(nomGrupo varchar(400)) 
begin
	select Us.identificacion as documento, Us.primerNombreUsuario as nomUsuario, Us.segundoNombreUsuario as nom2Usuario, 
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

