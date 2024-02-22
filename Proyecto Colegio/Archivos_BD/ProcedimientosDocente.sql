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

/*--------------------------Validar existencia Docente-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeDocente` $$
create procedure `existeDocente`(identificacionDocente varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM Docente as d
	WHERE d.fkidentificacion = (select ObtenerIdDocente((select CAST(identificacionDocente AS SIGNED))));
END$$

/*--------------------------Registrar Docente Grado-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarDocenteGrado` $$
create procedure `registrarDocenteGrado`(
    identificacionDocente varchar(400),
    nomGrado varchar(400)
) 
begin
	insert into DocentesGrado (estadoDocenteGrado, fkidDocente, fkidGrado)				
				value("Activo", (select ObtenerIdDocente((select CAST(identificacionDocente AS SIGNED)))), (select ObtenerIdGrado(nomGrado)) );
END$$

/*--------------------------Validar existencia Docente Grado-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeDocenteGrado` $$
create procedure `existeDocenteGrado`(identificacionDocente varchar(400), nomGrado varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM DocentesGrado as dg
	WHERE dg.fkidDocente = (select ObtenerIdDocente( (select CAST(identificacionDocente AS SIGNED)))) 
		  and dg.fkidGrado = (select ObtenerIdGrado(nomGrado)) ;
END$$


/*--------------------------Registrar Docente Asignatura-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarDocenteAsignatura` $$
create procedure `registrarDocenteAsignatura`(
    identificacionDocente varchar(400),
    asignatura varchar(400)
) 
begin
	insert into DocenteAsignatura (estadoDocenteAsignatura, fkidDocente, fkidAsignatura)				
				value("Asignado", (select ObtenerIdDocente((select CAST(identificacionDocente AS SIGNED)))), (select ObtenerIdAsignatura(asignatura)) );
END$$

/*--------------------------Validar existencia Docente Asignatura-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `existeDocenteAsignatura` $$
create procedure `existeDocenteAsignatura`(identificacionDocente varchar(400), nomAsignatura varchar(400)) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM DocenteAsignatura as da
	WHERE da.fkidDocente = (select ObtenerIdDocente( (select CAST(identificacionDocente AS SIGNED)))) 
		  and da.fkidAsignatura = (select ObtenerIdAsignatura(nomAsignatura)) ;
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



