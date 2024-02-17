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

