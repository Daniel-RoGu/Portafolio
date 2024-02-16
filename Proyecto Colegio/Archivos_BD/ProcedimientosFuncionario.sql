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