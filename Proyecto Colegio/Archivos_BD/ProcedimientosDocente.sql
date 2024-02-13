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