use bdColegio;

/*--------------------------Validar Registro TipoSangre-------------------------*/
DELIMITER $$
DROP PROCEDURE IF EXISTS `validarTipoSangre` $$
create procedure `validarTipoSangre`(
    nomTpSangre varchar(45)
) 
begin
	select exists(select TipoSangre.nombreTipoSangre from TipoSangre where TipoSangre.nombreTipoSangre = nomTpSangre) as Resultado;
END$$

call validarTipoSangre("O+");