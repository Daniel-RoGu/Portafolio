use bdColegio;

/*--------------------------Registrar Funcionario-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarFuncionario` $$
create procedure `registrarFuncionario`(
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
    firmaFuncionario longblob,
    sede varchar(400)
) 
begin
	call registrarUsuario((SELECT CAST(documento AS SIGNED)), nomUsuario, nom2Usuario, apellidoUsuario, apellido2Usuario, (SELECT CAST(edad AS SIGNED)), telCelular, telFijo, correoUss, direccionUss, barrioUss, 
						  fechaNacimientoUss, tipoSangre, tipoDocumento, nombreDiscapacidad, nombreSisben, nombreGenero, nombreEps, nombreEstrato, "Coordinador");
	insert into Funcionario (firmaFuncionario, estadoFuncionario, Usuario_identificacion, fkidSede)
				value(firmaFuncionario, "Activo", (SELECT CAST(documento AS SIGNED)), (select ObtenerIdSede(sede)));
END$$

/*--------------------------Registrar ModalidadEducativa-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarModalidadEducativa` $$
create procedure `registrarModalidadEducativa`(
    nomModalidadEducativa varchar(400)
) 
begin
	insert into modalida_educativa (nombreModalidad, estadoModalidad)
				value(nomModalidadEducativa, "Activa");
END$$

/*--------------------------Registrar Matricula-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarMatricula` $$
create procedure `registrarMatricula`(
    jornadaEs varchar(400),
    fechaInicioM varchar(400),
    fechaFinM varchar(400),
    esInternado varchar(400),
    gradoEst varchar(400),
    grupoEst varchar(400),
    identificacionEst varchar(400),
    identificacionFuncionario varchar(400),
    nombreSede varchar(400)
) 
begin
	declare fechaTermina varchar(400);
    declare esInternadoM varchar(400);
    SET fechaTermina = IFNULL(fechaFinM, 'Sin registro');
    set esInternadoM = IFNULL(esInternado, 'Sin registro');
	insert into Matricula (jornada, fechaInicio, fechaFin, internadoEstado, gradoEstudiante, grupoEstudiante, estadoMatricula, fkidEstudiante,
						   fkidFuncionario, fkidSede)
				value(jornadaEs, fechaInicioM, fechaTermina, esInternadoM, gradoEst, grupoEst, "Activa", (select ObtenerIdEstudiante((SELECT CAST(identificacionEst AS SIGNED)))), 
                (select ObtenerIdFuncionario((SELECT CAST(identificacionFuncionario AS SIGNED)))), (select ObtenerIdSede(nombreSede)) );
END$$

/*--------------------------Registrar Sede-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarSede` $$
create procedure `registrarSede`(
    nomSede varchar(400)
) 
begin
	insert into Sede (nombreSede, internadoDisponibilidad, estadoSede, fk_idModalida_Educativa)
				value(nomSede, "No", "Activa", (select ObtenerIdModalidadEducativa("Sin definir")));
END$$

/*--------------------------Registrar Asignatura-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarAsignatura` $$
create procedure `registrarAsignatura`(
    nomAsignatura varchar(400)
) 
begin
	insert into Asignatura (nombreAsignatura, estadoAsignatura, horasSemanales)
				value(nomAsignatura, "Activa", 0);
END$$

/*--------------------------Registrar Tipo Nota-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarTipoNota` $$
create procedure `registrarTipoNota`(
    nomTpNota varchar(400)
) 
begin
	insert into tipoNota (tipoNota, porcentajeNota, estadoNota)
				value(nomTpNota, "Sin definir", "Activo");
END$$

/*--------------------------Registrar Grado-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarGrado` $$
create procedure `registrarGrado`(
    nomGrado varchar(400)
) 
begin
	if (existeGradoRetorno(nomGrado) = 0) then
		insert into Grados (nombreGrado, estadoGrado)
				value(nomGrado, "Activo");
    end if;
END$$

/*--------------------------Registrar GradoGrupo-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarGradoGrupo` $$
create procedure `registrarGradoGrupo`(
    nomGrado varchar(400),
    nomGradoGrupo varchar(400)
) 
begin
	call registrarGrado(nomGrado);
	insert into GradoGrupo (nombreTitular, grupoGrado, estadoGrupoGrado, fkidGrado)
				value("Por definir", nomGradoGrupo, "Activo", (select ObtenerIdGrado(nomGrado)) );
END$$

/*--------------------------Registrar Sede Grado-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarSedeGrado` $$
create procedure `registrarSedeGrado`(
    nomSede varchar(400),
    nomGrado varchar(400)
) 
begin
	insert into SedeGrados (estadoGradoSede, fkidSede, fkidGrado)
				value("Activo", (select ObtenerIdSede(nomSede)), (select ObtenerIdGrado(nomGrado)) );
END$$

/*--------------------------Registrar Estudiantes Grado-Grupo-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarEstudiantesGradoGrupo` $$
create procedure `registrarEstudiantesGradoGrupo`(
    identificacionEst varchar(400),
    grupoGrado varchar(400)
) 
begin
	insert into EstudiantesGradoGrupo (rendimientoGeneral, estadoEstudianteGG, fkidEstudiante, fkidGradoGrupo)
				value("Sin definir", "Activo", (select ObtenerIdEstudiante(CAST(identificacionEst AS SIGNED))), (select ObtenerIdGradoGrupo(grupoGrado)) );
END$$

/*--------------------------Registrar Asignaturas del Grado-Grupo-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarAsignaturaGradoGrupo` $$
create procedure `registrarAsignaturaGradoGrupo`(
    nomAsignatura varchar(400),
    grupoGrado varchar(400)
) 
begin
	insert into AsignaturaGradoGrupo (estadoAsignaturaGG, fkidGradoGrupo, fkidAsignatura)
				value("Disponible", (select ObtenerIdGradoGrupo(grupoGrado)), (select ObtenerIdAsignatura(nomAsignatura)) );
END$$

/*--------------------------Registrar Competencias Asignaturas-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarCompetenciasAsignatura` $$
create procedure `registrarCompetenciasAsignatura`(
    nomCompetencia varchar(400),
    objCompetencia varchar(400),
    competenciaDetalle varchar(400),
    nomAsignatura varchar(400)
) 
begin
	insert into Competencias (nombreCompetencia, objetivoCompetencia, informacionCompetencia, estadoCompetencia, fkidAsignatura)
				value(nomCompetencia, objCompetencia, competenciaDetalle, "Disponible", (select ObtenerIdAsignatura(nomAsignatura)) );
END$$

/*--------------------------Registrar Periodo Academico-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarPeriodoAcademico` $$
create procedure `registrarPeriodoAcademico`(
    nomPeriodo varchar(400),
    inicia varchar(400),
    termina varchar(400)
) 
begin
	insert into periodoAcademico (periodoAcademico, fechaInicio, fechaFin, estadoPeriodo)
				value(nomPeriodo, inicia, termina, "Disponible");
END$$

/*--------------------------Obtener Sedes-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerSedes` $$
create procedure `ObtenerSedes`(
) 
begin
	select Sede.idSede as IdSede, Sede.nombreSede as Sede from Sede;
END$$

/*--------------------------Obtener Tipos de Sangre-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerTipoSangre` $$
create procedure `ObtenerTipoSangre`(
) 
begin
	select ts.idTipoSangre as IdTipoSangre, ts.nombreTipoSangre as TipoSangre from tipoSangre as ts;
END$$

/*--------------------------Obtener Tipos de Documento-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerTipoDocumento` $$
create procedure `ObtenerTipoDocumento`(
) 
begin
	select td.idTipoDocumento as idTipoDocumento, td.nombreTipoDocumento as TipoDocumento from tipoDocumento as td;
END$$


/*--------------------------Obtener Tipos Discapacidad-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerDiscapacidad` $$
create procedure `obtenerDiscapacidad`(
) 
begin
	select d.idDiscapacidad as IdDiscapacidad, d.nombreDiscapacidad as Discapacidad from Discapacidad as d;
END$$


/*--------------------------Obtener Tipos Sisben-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerSisben` $$
create procedure `obtenerSisben`(
) 
begin
	select s.idSisben as IdSisben, s.nombreSisben as Siben from Sisben as s;
END$$


/*--------------------------Obtener Generos-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerGenero` $$
create procedure `obtenerGenero`(
) 
begin
	select g.idGenero as IdGenero, g.nombreGenero as Genero from Genero as g;
END$$


/*--------------------------Obtener EPSs-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerEPS` $$
create procedure `obtenerEPS`(
) 
begin
	select EPS.idEPS as IdEPS, EPS.nombreEPS as EPS from EPS;
END$$


/*--------------------------Obtener Estratos-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerEstrato` $$
create procedure `obtenerEstrato`(
) 
begin
	select e.idEstrato as IdEstrato, e.nombreEstrato as Estrato from Estrato as e;
END$$

/*--------------------------Obtener Asignaturas-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerAsignaturas` $$
create procedure `obtenerAsignaturas`(
) 
begin
	select a.idAsignatura as IdAsignatura, a.nombreAsignatura as Asignatura from Asignatura as a;
END$$

/*--------------------------Obtener Grupos por Grado-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerGruposGrado` $$
create procedure `obtenerGruposGrado`(
) 
begin
	select gg.idGradoGrupo as IdGradoGrupo, gg.grupoGrado as Grupo from GradoGrupo as gg;
END$$

/*--------------------------Obtener Grados-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerGrados` $$
create procedure `obtenerGrados`(
) 
begin
	select g.idGrado as IdGrado, g.nombreGrado as Grado from Grados as g;
END$$

/*--------------------------Obtener Grupos por Grado de Sede-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerGruposGradoSede` $$
create procedure `obtenerGruposGradoSede`(
	sedeGradoGrupo varchar(400)
) 
begin
	select DISTINCT gg.idGradoGrupo as IdGradoGrupo, gg.grupoGrado as Grupo 
    from Sede as s
    inner join SedeGrados as sg on sg.fkidSede = s.idSede
    inner join Grados as g on sg.fkidGrado = g.idGrado
    inner join GradoGrupo as gg on gg.fkidGrado = g.idGrado  
    where s.nombreSede = sedeGradoGrupo;
END$$


/*--------------------------Obtener Grado de Sede-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerGradosXSede` $$
create procedure `obtenerGradosXSede`(
	sedeGradoGrupo varchar(400)
) 
begin
	select DISTINCT g.idGrado as IdGrado, g.nombreGrado as Grupo 
    from Sede as s
    inner join SedeGrados as sg on sg.fkidSede = s.idSede
    inner join Grados as g on sg.fkidGrado = g.idGrado 
    where s.nombreSede = sedeGradoGrupo;
END$$

/*--------------------------Obtener Estudiantes Sede_Grado-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerEstudianteSedeGrado` $$
create procedure `obtenerEstudianteSedeGrado`(
	nomSede varchar(400),
    nomGrupo varchar(400)
) 
begin
	select Us.identificacion as documento, Us.primerNombreUsuario as nomUsuario, Us.segundoNombreUsuario as nom2Usuario, Us.primerApellidoUsuario as apellidoUsuario, Us.segundoApellidoUsuario as apellido2Usuario, Us.edadUsuario as edad,
		   Us.telefonoCelular as telCelular, Us.telefonoFijo as telFijo, Us.correo as correoUss, Us.direccion as direccioUss, Us.barrioUbicacionUsuario as barrioUss, Us.fechaNacimiento as fechaNacimientoUss, Us.estadoUsuario as estadoUss, (select ObtenerNombreTipoSangre(Us.fkidTipoSangre)) as tipoSangre,
           (select ObtenerNombreTipoDocumento(Us.fkidTipoDocumento)) as tipoDocumento, (select ObtenerNombreDiscapacidad(Us.fkidDiscapacidad)) as nombreDiscapacidad, (select ObtenerNombreSisben(Us.fkidSisben)) as nombreSisben,
           (select ObtenerNombreGenero(Us.fkidGenero)) as nombreGenero, (select ObtenerNombreEPS(Us.fkidEPS)) as nombreEPS, (select ObtenerNombreEstrato(Us.fkidEstrato)) as nombreEstrato
	From Sede as s
    inner join sedeGrados as sg on sg.fkidSede = s.idSede
    inner join Grados as g on sg.fkidGrado = g.idGrado
    inner join gradoGrupo as gg on gg.fkidGrado = g.idGrado and gg.grupoGrado = nomGrupo
    inner join estudiantesGradoGrupo as egg on egg.fkidGradoGrupo = gg.idGradoGrupo
    inner join Estudiante as e on egg.fkidEstudiante = e.idEstudiante
    inner join Usuario as Us on e.Usuario_identificacion = Us.identificacion
    where s.nombreSede = nomSede;
END$$

/*--------------------------Obtener Estudiantes Sede Grupo-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerEstudiantesSedeGrupo` $$
create procedure `obtenerEstudiantesSedeGrupo`(nomSede varchar(400), nomGrupo varchar(400)) 
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
    From Usuario as Us
    inner join Estudiante as e on e.Usuario_identificacion = Us.identificacion
    inner join estudiantesGradoGrupo as egg on egg.fkidEstudiante = e.idEstudiante 
    inner join GradoGrupo as gg on gg.grupoGrado = nomGrupo and egg.fkidGradoGrupo = gg.idGradoGrupo  
    inner join Grados as g on gg.fkidGrado = g.idGrado 
    inner join sedeGrados as sg on sg.fkidGrado = g.idGrado 
    inner join Sede as s on sg.fkidSede = s.idSede
    inner join matricula as m on m.fkidEstudiante = e.idEstudiante and m.fkidSede = s.idSede
    where s.nombreSede = nomSede;
    
END$$

/*--------------------------Obtener Estudiantes Sede Grupo 2-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerEstudiantesSedeGrupo2` $$
create procedure `obtenerEstudiantesSedeGrupo2`(nomSede varchar(400), nomGrupo varchar(400)) 
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
           COALESCE((select ObtenerNombreEstrato(Us.fkidEstrato)), 'Sin definir') as nombreEstrato, g.nombreGrado as Grado, 
           gg.grupoGrado as Grupo
    From Usuario as Us
    inner join Estudiante as e on e.Usuario_identificacion = Us.identificacion
    inner join estudiantesGradoGrupo as egg on egg.fkidEstudiante = e.idEstudiante 
    inner join GradoGrupo as gg on gg.grupoGrado = nomGrupo and egg.fkidGradoGrupo = gg.idGradoGrupo  
    inner join Grados as g on gg.fkidGrado = g.idGrado 
    inner join sedeGrados as sg on sg.fkidGrado = g.idGrado 
    inner join Sede as s on sg.fkidSede = s.idSede
    inner join matricula as m on m.fkidEstudiante = e.idEstudiante and m.fkidSede = s.idSede
    where s.nombreSede = nomSede;
    
END$$

/*--------------------------Obtener Estudiantes Sede-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerEstudiantesSede` $$
create procedure `obtenerEstudiantesSede`(nomSede varchar(400)) 
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
    From Usuario as Us
    inner join Estudiante as e on e.Usuario_identificacion = Us.identificacion
    inner join matricula as m on m.fkidEstudiante = e.idEstudiante
    inner join Sede as s on m.fkidSede = s.idSede
    where s.nombreSede = nomSede;
    
END$$

/*--------------------------Obtener Estudiantes Sede 2-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerEstudiantesSede2` $$
create procedure `obtenerEstudiantesSede2`(nomSede varchar(400)) 
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
           COALESCE((select ObtenerNombreEstrato(Us.fkidEstrato)), 'Sin definir') as nombreEstrato, g.nombreGrado as Grado, 
           gg.grupoGrado as Grupo
    From Usuario as Us
    inner join Estudiante as e on e.Usuario_identificacion = Us.identificacion
    inner join matricula as m on m.fkidEstudiante = e.idEstudiante
    inner join Sede as s on m.fkidSede = s.idSede
    left join estudiantesGradoGrupo as egg on egg.fkidEstudiante = e.idEstudiante
    inner join GradoGrupo as gg on egg.fkidGradoGrupo = gg.idGradoGrupo
    inner join Grados as g on gg.fkidGrado = g.idGrado
    where s.nombreSede = nomSede;
    
END$$
