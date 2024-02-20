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
	insert into Matricula (jornada, fechaInicio, fechaFin, internadoEstado, gradoEstudiante, grupoEstudiante, estadoMatricula, fkidEstudiante,
						   fkidFuncionario, fkidSede)
				value(jornadaEs, fechaInicioM, fechaFinM, esInternado, gradoEst, grupoEst, "Activa", (select ObtenerIdEstudiante((SELECT CAST(identificacionEst AS SIGNED)))), 
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

/*--------------------------Obtener Sedes-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerSedes` $$
create procedure `ObtenerSedes`(
) 
begin
	select Sede.nombreSede as Sede from Sede;
END$$

/*--------------------------Obtener Tipos de Sangre-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerTipoSangre` $$
create procedure `ObtenerTipoSangre`(
) 
begin
	select ts.nombreTipoSangre as TipoSangre from tipoSangre as ts;
END$$

/*--------------------------Obtener Tipos de Documento-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `ObtenerTipoDocumento` $$
create procedure `ObtenerTipoDocumento`(
) 
begin
	select td.nombreTipoDocumento as TipoDocumento from tipoDocumento as td;
END$$


/*--------------------------Obtener Tipos Discapacidad-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerDiscapacidad` $$
create procedure `obtenerDiscapacidad`(
) 
begin
	select d.nombreDiscapacidad as Discapacidad from Discapacidad as d;
END$$


/*--------------------------Obtener Tipos Sisben-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerSisben` $$
create procedure `obtenerSisben`(
) 
begin
	select s.nombreSisben as Siben from Sisben as s;
END$$


/*--------------------------Obtener Generos-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerGenero` $$
create procedure `obtenerGenero`(
) 
begin
	select g.nombreGenero as Genero from Genero as g;
END$$


/*--------------------------Obtener EPSs-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerEPS` $$
create procedure `obtenerEPS`(
) 
begin
	select EPS.nombreEPS as EPS from EPS;
END$$


/*--------------------------Obtener Estratos-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtenerEstrato` $$
create procedure `obtenerEstrato`(
) 
begin
	select e.nombreEstrato as Estrato from Estrato as e;
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
