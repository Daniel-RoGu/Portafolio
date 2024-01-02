USE `adopciones`;

/*------Registrar Vacunas----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `registrarVacuna` $$
create procedure `registrarVacuna`(
	nombreVacuna varchar(45)
) 
begin
	insert into Vacunas (nombreVacuna, estadoVacuna) values (nombreVacuna, "Disponible");
END$$

/*------Eliminar Vacunas----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `eliminarVacuna` $$
create procedure `eliminarVacuna`(
	IN nomVacuna varchar(45)
) 
begin
	declare vacunaId int;
    set vacunaId = (select `idVacunas` from Vacunas
						where Vacunas.`nombreVacuna` = nomVacuna);
	delete from Vacunas where `idVacunas` = vacunaId;
END$$

/*------Mostrar Vacunas----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `mostrarVacuna` $$
create procedure `mostrarVacuna`() 
begin
	select * from Vacunas;
END$$

/*------Editar Vacunas----------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `editarVacuna` $$
create procedure `editarVacuna`(
	IN nomVacuna varchar(80),
    nuevoNombre varchar(80),
    nuevoEstado varchar(20)
) 
begin
	declare vacunaid int;
    set vacunaid = (select `idVacunas` from Vacunas where `nombreVacuna` = nomVacuna);
	update Vacunas set `nombreVacuna` = nuevoNombre, `estadoVacuna` = nuevoEstado
    where `idVacunas` = vacunaid;
END$$