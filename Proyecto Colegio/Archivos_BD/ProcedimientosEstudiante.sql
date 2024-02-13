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
    identificacionFamiliarEs int,
    nombreFamiliarEs varchar(400),
    apellidoFamiliarEs varchar(400),
    correoFamiliarEs varchar(400),
    celularFamiliarEs varchar(100),
    parentescoFamiliarEs varchar(400),
    responsabilidadEconomicaFamiliarEs varchar(400),
    generoFamiliarEs varchar(400),
    identificacionEstudianteEs int
) 
begin
	insert into Acudiente (identificacionFamiliar, nombreFamiliar, apellidoFamiliar, correoFamiliar, celularFamiliar, 
						   parentescoFamiliar, responsabilidadEconomicaEstudiante, estadoAcudiente, Genero_idGenero, Estudiante_idEstudiante)
				value(identificacionFamiliarEs, nombreFamiliarEs, apellidoFamiliarEs, correoFamiliarEs, celularFamiliarEs, parentescoFamiliarEs,
					  responsabilidadEconomicaFamiliarEs, "No", (select ObtenerIdGenero(generoFamiliarEs)), (select ObtenerIdEstudiante(identificacionEstudianteEs)));
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