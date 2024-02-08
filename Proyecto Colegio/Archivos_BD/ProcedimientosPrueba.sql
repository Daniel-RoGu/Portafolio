use bdColegio;

/*modificador de tabla para usar formato de texto utf8mb4*/
ALTER TABLE Usuario CONVERT TO CHARACTER SET utf8mb4;

/*--------------------------Registrar TipoSangre-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarTipoSangre` $$
create procedure `registrarTipoSangre`(
    nomTpSangre varchar(400)
) 
begin
	insert into TipoSangre (nombreTipoSangre, estadoTipoSangre)
				value(nomTpSangre, "Activo");
END$$

/*--------------------------Registrar TipoDocumento-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarTipoDocumento` $$
create procedure `registrarTipoDocumento`(
    nomTpDocumento varchar(400)
) 
begin
	insert into TipoDocumento (nombreTipoDocumento, estadoTipoDocumento)
				value(nomTpDocumento, "Activo");
END$$

/*--------------------------Registrar Discapacidad-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarDiscapacidad` $$
create procedure `registrarDiscapacidad`(
    nomDiscapacidad	 varchar(400)
) 
begin
	insert into Discapacidad (nombreDiscapacidad, estadoDiscapacidad)
				value(nomDiscapacidad, "Activo");
END$$

/*--------------------------Registrar Genero-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarGenero` $$
create procedure `registrarGenero`(
    nomGenero varchar(400)
) 
begin
	insert into Genero (nombreGenero, estadoGenero)
				value(nomGenero, "Activo");
END$$

/*--------------------------Registrar EPS-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarEPS` $$
create procedure `registrarEPS`(
    nomEPS varchar(400)
) 
begin
	insert into EPS (nombreEPS, estadoEPS)
				value(nomEPS, "Activo");
END$$

/*--------------------------Registrar Estrato-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarEstrato` $$
create procedure `registrarEstrato`(
    nomEstrato varchar(400)
) 
begin
	insert into Estrato (nombreEstrato, estadoEstrato)
				value(nomEstrato, "Activo");
END$$

/*--------------------------Registrar Rol-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarRol` $$
create procedure `registrarRol`(
    nomRol varchar(400)
) 
begin
	insert into Rol (nombreRol, estadoRol)
				value(nomRol, "Activo");
END$$

/*--------------------------Registrar Permiso-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarPermiso` $$
create procedure `registrarPermiso`(
    nomPermiso varchar(400)
) 
begin
	insert into Permiso (nombrePermiso, estadoPermiso)
				value(nomPermiso, "Activo");
END$$

/*--------------------------Registrar RolPermiso-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarRolPermiso` $$
create procedure `registrarRolPermiso`(
    nombreInterfaz varchar(400),
    nombreCarpetaRaiz varchar(400),
    nombreRol varchar(400),
    nombrePermiso varchar(400)
) 
begin
	insert into RolPermiso (nombreVista, vistaRaiz, fkidRol, fkidPermiso)
				value(nombreInterfaz, nombreCarpetaRaiz, (select ObtenerIdRol(nombreRol)), (select ObtenerIdPermiso(nombrePermiso)));
END$$

/*--------------------------Registrar Sisben-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarSisben` $$
create procedure `registrarSisben`(
    nomSisben varchar(400)
) 
begin
	insert into Sisben (nombreSisben, estadoSisben)
				value(nomSisben, "Activo");
END$$

/*--------------------------Registrar Usuario-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarUsuario` $$
create procedure `registrarUsuario`(
	documento BIGINT,
	nomUsuario varchar(400),
    nom2Usuario varchar(400),
    apellidoUsuario varchar(400),
    apellido2Usuario varchar(400),
    edad int,
    telCelular varchar(400),
    telFijo varchar(400),
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
    nombreRol varchar(400)
) 
begin
	insert into Usuario (identificacion, primerNombreUsuario, segundoNombreUsuario, primerApellidoUsuario, segundoApellidoUsuario, edadUsuario,
						   telefonoCelular, telefonoFijo, correo, direccion, barrioUbicacionUsuario, fechaNacimiento, estadoUsuario, fkidTipoDocumento,
                           fkidTipoSangre, fkidDiscapacidad, fkidSisben, fkidRol, fkidEstrato, fkidEPS, fkidGenero)
				value(documento, nomUsuario, nom2Usuario, apellidoUsuario, apellido2Usuario, edad, telCelular, telFijo, correoUss,
					   direccionUss, barrioUss, fechaNacimientoUss, "Activo", (select ObtenerIdTipoDocumento(tipoDocumento)), (select ObtenerIdTipoSangre(tipoSangre)), 
					   (select ObtenerIdDiscapacidad(nombreDiscapacidad)), (select ObtenerIdSisben(nombreSisben)), (select ObtenerIdRol(nombreRol)), (select ObtenerIdEstrato(nombreEstrato)), 
                       (select ObtenerIdEPS(nombreEps)), (select ObtenerIdGenero(nombreGenero)));
END$$

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
                      asistenciaAcademicaEspecialEs, desplazadoEstadoEs, documento);
END$$

/*--------------------------Registrar Acudiente-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarAcudiente` $$
create procedure `registrarAcudiente`(
    identificacionAcudienteEs int,
    nombreAcudienteEs varchar(400),
    apellidoAcudienteEs varchar(400),
    correoAcudienteEs varchar(400),
    celularAcudienteEs varchar(100),
    parentescoAcudienteEs varchar(400),
    responsabilidadEconomicaAcudienteEs varchar(400),
    generoAcudienteEs varchar(400),
    identificacionEstudianteEs int
) 
begin
	insert into Acudiente (identificacionAcudiente, nombreAcudiente, apellidoAcudiente, correoAcudiente, celularAcudiente, 
						   parentescoEstudiante, responsabilidadEconomicaEstudiante, estadoAcudiente, Genero_idGenero, Estudiante_idEstudiante)
				value(identificacionAcudienteEs, nombreAcudienteEs, apellidoAcudienteEs, correoAcudienteEs, celularAcudienteEs, parentescoAcudienteEs,
					  responsabilidadEconomicaAcudienteEs, "Activo", (select ObtenerIdGenero(generoAcudienteEs)), (select ObtenerIdEstudiante(identificacionEstudianteEs)));
END$$

/*--------------------------Registrar ModalidadEducativa-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarModalidadEducativa` $$
create procedure `registrarModalidadEducativa`(
    nomModalidadEducativa varchar(400)
) 
begin
	insert into ModalidadEducativa (nombreModalidad, estadoModalidad)
				value(nomModalidadEducativa, "Activa");
END$$

/*--------------------------Registrar Sede-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarSede` $$
create procedure `registrarSede`(
    nomSede varchar(400),
    esInternado varchar(400),
    nomModalidadEducativa varchar(400)
) 
begin
	insert into Sede (nombreSede, internadoDisponibilidad, estadoSede, fk_idModalidadEducativa)
				value(nomSede, esInternado, "Activa", (select ObtenerIdModalidadEducativa(nomModalidadEducativa)));
END$$

/*--------------------------Registrar Docente-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarDocente` $$
create procedure `registrarDocente`(
    horasTrabaja varchar(45),
    documento int,
    nomSede varchar(400),
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
    nombreEstrato varchar(400),
    nombreRol varchar(400)
) 
begin
	call registrarUsuario(documento, nomUsuario, nom2Usuario, apellidoUsuario, apellido2Usuario, edad, telCelular, telFijo, correoUss,
						  direccionUss, barrioUss, fechaNacimientoUss, tipoSangre, tipoDocumento, nombreDiscapacidad, nombreSisben, nombreGenero,
                          nombreEps, nombreEstrato, nombreRol);
	insert into Docente (estadoDocente, horasLaboralesSemanales, Usuario_identificacion, Sede_idSede)
				value("Activo", horasTrabaja, (select ObtenerIdUsuario(documento)), (select ObtenerIdSede(nomSede)));
END$$

