/*-------orden de ejecucion de scripts ---------- Script Nº4*/
use bdColegio;

/*--------------------------Registrar Estudiante-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarEstudiante` $$
create procedure `registrarEstudiante`(
	documento varchar(400),
	nomUsuario varchar(400),
    nom2Usuario varchar(400),
    apellidoUsuario varchar(400),
    apellido2Usuario varchar(400),
    edad varchar(400),
    telCelular varchar(400),
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
    nombreEstrato varchar(400),
    codigoStudent varchar(400),
    ciudadNacimientoEs varchar(400),
    ciudadResidenciaEs varchar(400),
    ciudadExpedicionDocumentoEs varchar(400),
    paisOrigenEs varchar(400),
    asistenciaAcademicaEspecialEs varchar(400),
    desplazadoEstadoEs varchar(400)
) 
begin
	call registrarUsuario((SELECT CAST(documento AS SIGNED)), nomUsuario, nom2Usuario, apellidoUsuario, apellido2Usuario, (SELECT CAST(edad AS SIGNED)), telCelular, telFijo, correoUss, direccionUss, barrioUss, 
						  fechaNacimientoUss, tipoSangre, tipoDocumento, nombreDiscapacidad, nombreSisben, nombreGenero, nombreEps, nombreEstrato, "Estudiante");
	insert into Estudiante (codigoEstudiante, ciudadNacimiento, ciudadResidencia, ciudadExpedicionDocumento, paisOrigen,
                           asistenciaAcademicaEspecial, desplazadoEstado, Usuario_identificacion)
				value(codigoStudent, ciudadNacimientoEs, ciudadResidenciaEs, ciudadExpedicionDocumentoEs, paisOrigenEs,
                      asistenciaAcademicaEspecialEs, desplazadoEstadoEs, (SELECT CAST(documento AS SIGNED)));
END$$

/*--------------------------Mostrar Estudiantes-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `mostrarEstudiantes` $$
create procedure `mostrarEstudiantes`() 
begin
	select Us.identificacion as documento, Us.primerNombreUsuario as nomUsuario, Us.segundoNombreUsuario as nom2Usuario, Us.primerApellidoUsuario as apellidoUsuario, Us.segundoApellidoUsuario as apellido2Usuario, Us.edadUsuario as edad,
		   Us.telefonoCelular as telCelular, Us.telefonoFijo as telFijo, Us.correo as correoUss, Us.direccion as direccioUss, Us.barrioUbicacionUsuario as barrioUss, Us.fechaNacimiento as fechaNacimientoUss, Us.estadoUsuario as estadoUss, (select ObtenerNombreTipoSangre(Us.fkidTipoSangre)) as tipoSangre,
           (select ObtenerNombreTipoDocumento(Us.fkidTipoDocumento)) as tipoDocumento, (select ObtenerNombreDiscapacidad(Us.fkidDiscapacidad)) as nombreDiscapacidad, (select ObtenerNombreSisben(Us.fkidSisben)) as nombreSisben,
           (select ObtenerNombreGenero(Us.fkidGenero)) as nombreGenero, (select ObtenerNombreEPS(Us.fkidEPS)) as nombreEPS, (select ObtenerNombreEstrato(Us.fkidEstrato)) as nombreEstrato
	From Usuario as Us
    inner join Estudiante on Estudiante.Usuario_identificacion = Us.identificacion;
END$$

/*--------------------------Mostrar Estudiantes 2-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `mostrarEstudiantes2` $$
create procedure `mostrarEstudiantes2`() 
begin
	select Us.identificacion as documento, Us.primerNombreUsuario as nomUsuario, Us.segundoNombreUsuario as nom2Usuario, Us.primerApellidoUsuario as apellidoUsuario, Us.segundoApellidoUsuario as apellido2Usuario, Us.edadUsuario as edad,
		   Us.telefonoCelular as telCelular, Us.telefonoFijo as telFijo, Us.correo as correoUss, Us.direccion as direccioUss, Us.barrioUbicacionUsuario as barrioUss, Us.fechaNacimiento as fechaNacimientoUss, Us.estadoUsuario as estadoUss, (select ObtenerNombreTipoSangre(Us.fkidTipoSangre)) as tipoSangre,
           (select ObtenerNombreTipoDocumento(Us.fkidTipoDocumento)) as tipoDocumento, (select ObtenerNombreDiscapacidad(Us.fkidDiscapacidad)) as nombreDiscapacidad, (select ObtenerNombreSisben(Us.fkidSisben)) as nombreSisben,
           (select ObtenerNombreGenero(Us.fkidGenero)) as nombreGenero, (select ObtenerNombreEPS(Us.fkidEPS)) as nombreEPS, (select ObtenerNombreEstrato(Us.fkidEstrato)) as nombreEstrato, g.nombreGrado as Grado, gg.grupoGrado as Grupo
	From Usuario as Us
    inner join Estudiante as e on e.Usuario_identificacion = Us.identificacion
    inner join EstudiantesGradoGrupo as egg on egg.fkidEstudiante = e.idEstudiante
    inner join GradoGrupo as gg on egg.fkidGradoGrupo = gg.idGradoGrupo
    inner join Grados as g on gg.fkidGrado = g.idGrado;
END$$

/*--------------------------Obtener codigo Estudiantes-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerCodigoEstudiantes` $$
create procedure `obtenerCodigoEstudiantes`(identificacionUs long) 
begin
	(select ObtenerCodigoEstudiante(identificacionUs) as CodigoEstudiante);
END$$

/*GRANT EXECUTE ON PROCEDURE bdColegio.obtenerCodigoEstudiantes TO 'root'@'localhost';*/

/*--------------------------Registrar Familiar-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarFamiliar` $$
create procedure `registrarFamiliar`(
    identificacionFamiliarEs long,
    nombreFamiliarEs varchar(400),
    ocupacionFamiliarEs varchar(400),
    correoFamiliarEs varchar(400),
    celularFamiliarEs varchar(100),
    parentescoFamiliarEs varchar(400),
    responsabilidadEconomicaFamiliarEs varchar(400),
    esAcudiente varchar(400),
    esdesplazado varchar(400),
    fechaNacimientoAcudiente varchar(400),
    nivelEscolaridadAcudiente varchar(400),
    ubicacionAcudiente varchar(400),
    generoFamiliarEs varchar(400),
    identificacionEstudianteEs long
) 
begin
	if ((FunexisteFamiliarEstudiante(identificacionFamiliarEs)) = 0) then
		insert into Familiar (identificacionFamiliar, nombreFamiliar, ocupacionFamiliar, correoFamiliar, celularFamiliar, 
							   parentescoFamiliar, responsabilidadEconomicaEstudiante, estadoAcudiente, esDezplazado, fechaNacimiento,
							   nivelEscolaridad, ubicacion, fkidGenero, Estudiante_idEstudiante)
					value(identificacionFamiliarEs, nombreFamiliarEs, ocupacionFamiliarEs, correoFamiliarEs, celularFamiliarEs, parentescoFamiliarEs,
						  responsabilidadEconomicaFamiliarEs, esAcudiente, esdesplazado, fechaNacimientoAcudiente, nivelEscolaridadAcudiente, ubicacionAcudiente,
						  (select ObtenerIdGenero(generoFamiliarEs)), (select ObtenerIdEstudiante(identificacionEstudianteEs)));
		select 1 as ValidacionRegistro;
	else
		select 0 as ValidacionRegistro;
	end if;
END$$

/*--------------------------Registrar Observacion-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarObservacionEst` $$
create procedure `registrarObservacionEst`(
    descripcionObsrv varchar(400),
    identificacionEstudiante varchar(400),
    identificacionFuncionario varchar(400)
) 
begin
	insert into Observaciones (descripcionObservacion, estadoObservacion, fkidEstudiante, fkidFuncionario)
				value(descripcionObsrv, "Activa", (select ObtenerIdEstudiante((SELECT CAST(identificacionEstudiante AS SIGNED)))) ,
                (select ObtenerIdFuncionario((SELECT CAST(identificacionFuncionario AS SIGNED)))) );
END$$


/*--------------------------Buscar Estudiante-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerEstudiante` $$
create procedure `obtenerEstudiante`(codigoEst Varchar(400)) 
begin
	/*select if(est.Usuario_identificacion = identificacionUs, true, false)
    from Estudiante as est;*/
    SELECT Us.primerNombreUsuario, Us.segundoNombreUsuario, Us.primerApellidoUsuario, Us.segundoApellidoUsuario
	FROM Estudiante as est
    inner join Usuario as Us
	WHERE est.idEstudiante = (SELECT CAST(codigoEst AS SIGNED)) and est.Usuario_identificacion = Us.identificacion;
END$$

/*--------------------------Buscar Grado y Grupo Estudiante-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerGradoYGrupoEstudiante` $$
create procedure `obtenerGradoYGrupoEstudiante`(identificacionEst Varchar(400)) 
begin
    SELECT g.nombreGrado as Grado, gg.grupoGrado as Grupo
	FROM Estudiante as e
    inner join estudiantesGradoGrupo as egg on fkidEstudiante = e.idEstudiante
    inner join gradoGrupo as gg on egg.fkidGradoGrupo = gg.idGradoGrupo
    inner join Grados as g on gg.fkidGrado = g.idGrado
	WHERE e.Usuario_identificacion = (SELECT CAST(identificacionEst AS SIGNED));
END$$

/*--------------------------Buscar Grado y Grupo Estudiante 2-------------------------*/
/*permite recuperar el valor del grado y el grupo en dos variables independientes (OUT) se usa en mostrarEstudiante2*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerGradoYGrupoEstudiante2` $$
CREATE PROCEDURE `obtenerGradoYGrupoEstudiante2`(
    IN identificacionEst VARCHAR(400),
    OUT resultadoGrado VARCHAR(100),
    OUT resultadoGrupo VARCHAR(100)
)
BEGIN
    SELECT g.nombreGrado, gg.grupoGrado
    INTO resultadoGrado, resultadoGrupo
    FROM Estudiante AS e
    INNER JOIN estudiantesGradoGrupo AS egg ON e.idEstudiante = egg.fkidEstudiante
    INNER JOIN gradoGrupo AS gg ON egg.fkidGradoGrupo = gg.idGradoGrupo
    INNER JOIN Grados AS g ON gg.fkidGrado = g.idGrado
    WHERE e.Usuario_identificacion = CAST(identificacionEst AS SIGNED);
END$$

/*--------------------------Obtener Familiares Estudiante-------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerFamiliaresEstudiante` $$
create procedure `obtenerFamiliaresEstudiante`(identificacionEst Varchar(400)) 
begin
    SELECT f.nombreFamiliar, f.parentescoFamiliar, f.estadoAcudiente 
    from estudiante as e
    inner join Familiar as f on f.Estudiante_idEstudiante = e.idEstudiante
    where e.idEstudiante = (select ObtenerIdEstudiante(CAST(identificacionEst AS SIGNED)));
END$$


DELIMITER $$
DROP PROCEDURE IF EXISTS `existeFamiliarEstudiante` $$
create procedure `existeFamiliarEstudiante`(identificacionFamiliar long) 
begin
    SELECT COUNT(*) > 0 AS existe_valor
	FROM Familiar as f
	WHERE f.identificacionFamiliar = identificacionFamiliar;
END$$

/*--------------------------Obtener Periodo Habilitado -------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerGrupoEstudiante` $$
create procedure `ObtenerGrupoEstudiante`(identificacionEstudiante long) 
begin    
		SELECT DISTINCT gg.grupoGrado as Grupo
        From Estudiante AS e
        inner join EstudiantesGradoGrupo as egg on egg.fkidEstudiante = e.idEstudiante
        inner join GradoGrupo as gg on egg.fkidGradoGrupo = gg.idGradoGrupo
        WHERE e.Usuario_identificacion = identificacionEstudiante;
END$$

/*--------------------------Obtener Periodo Habilitado -------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerGradoEstudiante` $$
create procedure `ObtenerGradoEstudiante`(identificacionEstudiante long) 
begin    
		SELECT DISTINCT g.nombreGrado as Grado
        From Estudiante AS e
        inner join EstudiantesGradoGrupo as egg on egg.fkidEstudiante = e.idEstudiante
        inner join GradoGrupo as gg on egg.fkidGradoGrupo = gg.idGradoGrupo
        inner join Grados as g on gg.fkidGrado = g.idGrado
        WHERE e.Usuario_identificacion = identificacionEstudiante;
END$$
