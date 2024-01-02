/*------Registrar Mascota_Vacunas----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarMascotaVacuna` $$
create procedure `registrarMascotaVacuna`(
	nombreM varchar(45),
    nombreV varchar(45),
    fechaVacuna varchar(20)
) 
begin
	insert into Mascota_Vacunas (fk_idMascota, fk_idVacunas, fechaVacuna, Vacuna)
    value ((select ObtenerIdMascota(nombreM)), (select ObtenerIdVacuna(nombreV)), fechaVacuna, "Disponible");
END$$

/*------Registrar Mascota----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarMascota` $$
create procedure `registrarMascota`(
	nombreM varchar(45),
    edadM int,
    pesoM int,
    generoM varchar(10),
    observaciones varchar(100),
    nombreRaza varchar(40),
    tipoMascota varchar(40),
    responsables varchar(40)
    /*
    vacunaMascota varchar(100),
    fechaVacuna varchar(40)*/
) 
begin
	insert into Mascota (nombreMascota, edadMascota, pesoMascota, generoMascota, observaciones, estadoMascota, fk_idRaza, fk_idTipo_Mascota, fk_idUsuario, imagen) 
    values (nombreM, edadM, pesoM, generoM, observaciones, "Disponible", ObtenerIdRaza(nombreRaza), ObtenerIdTpMascota(tipoMascota), ObtenerIdUsuario(responsables), "noDisponible");
    /*call registrarMascotaVacuna(nombreM, vacunaMascota, fechaVacuna);*/
END$$

/*------Mostrar Mascota----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `mostrarMascota` $$
create procedure `mostrarMascota`() 
begin
	select m.nombreMascota as Mascota, m.edadMascota as Edad, m.pesoMascota as Peso, m.generoMascota as Genero,
			m.observaciones as Observaciones, m.estadoMascota as Estado, r.nombreRaza, tpm.tipoMascota as Tipo,
            u.nombreUsuario as Responsable
	from Mascota as m
    inner join Raza as r on m.fk_idRaza = r.idRaza
    left join Tipo_Mascota as tpm on m.fk_idTipo_Mascota = tpm.idTipoMascota
    left join Usuario as u on m.fk_idUsuario = u.idUsuario;
END$$

/*------Mostrar VacunasMascota----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `mostrarVacunasMascota` $$
create procedure `mostrarVacunasMascota`(
	IN nomMascota varchar(40)
) 
begin
	select m.nombreMascota as Mascota, (select GROUP_CONCAT(v.nombreVacuna SEPARATOR ', ')  
										from Mascota_Vacunas as mv
										inner join Mascota as m on mv.fk_idMascota = m.idMascota
										left join Vacunas as v on mv.fk_idVacunas = v.idVacunas) as Vacunas_Mascota
	from Mascota_Vacunas as mv
    inner join Mascota as m on mv.fk_idMascota = m.idMascota and m.nombreMascota = nomMascota
    limit 1;
END$$


/*select GROUP_CONCAT(v.nombreVacuna SEPARATOR ', ') as Vacunas_Mascota from Vacunas as v;*/


/*------Editar Mascota----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `editarMascota` $$
create procedure `editarMascota`(
	nombreM varchar(45),
    nuevaEdad int,
    nuevoPeso int,
    nuevaObservaciones varchar(100),
    nuevoEstado varchar(40)
) 
begin
	update Mascota set edadMascota = nuevaEdad, pesoMascota = nuevoPeso, observaciones = nuevaObservaciones,
    estadoMascota = nuevoEstado where idMascota = (select ObtenerIdMascota(nombreM));
END$$