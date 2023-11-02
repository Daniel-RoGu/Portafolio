
DELIMITER $$
DROP PROCEDURE IF EXISTS `reporte_adopciones` $$
create procedure `reporte_adopciones`(
) 
begin
	select (select u.nombreUsuario from Usuario as u inner join mascota as m on m.fk_idUsuario = u.idUsuario
													 inner join adopcion as a on a.fk_idMascota = m.idMascota
													 inner join control_adopcion as ct on ct.fk_idAdopcion = a.idAdopcion
                                                     group by u.nombreUsuario limit 1) as Dueño,
	m.nombreMascota as Mascota, u.nombreUsuario as Solicitante, a.fechaInicioAdopcion as Inicio_Adopcion, a.fechaFinAdopcion as Fin_Adopcion, 
    a.estadoAdopcion as Solicitud, ct.nombreProceso as Adopcion
	from mascota as m
	inner join adopcion as a on a.fk_idMascota = m.idMascota
    inner join control_adopcion as ct on ct.fk_idAdopcion = a.idAdopcion
    inner join usuario as u on ct.fk_idUsuario = u.idUsuario;
    
END$$

call reporte_adopciones();

DELIMITER $$
DROP PROCEDURE IF EXISTS `reporte_mascota_todas` $$
create procedure `reporte_mascota_todas`(
) 
begin

	select m.nombreMascota as Mascota, m.edadMascota as Edad, m.estadoMascota as Estado, tpM.tipoMascota as Especie, r.nombreRaza as Raza, u.nombreUsuario as Dueño from mascota as m
	inner join raza as r on m.fk_idRaza = r.idRaza
    left join tipo_mascota as tpM on m.fk_idTipo_Mascota = tpM.idTipoMascota
    left join usuario as u on m.fk_idUsuario = u.idUsuario;
    
END$$

call reporte_mascota_todas();

DELIMITER $$
DROP PROCEDURE IF EXISTS `reporte_mascota_filtro` $$
create procedure `reporte_mascota_filtro`(
tipoMascota varchar(20),
raza_mascota varchar(20),
genero varchar(20),
estado varchar(20),
edad int
) 
begin

	select m.nombreMascota as Mascota, m.edadMascota as Edad_Años, m.estadoMascota as Estado, tpM.tipoMascota as Especie, r.nombreRaza as Raza, u.nombreUsuario as Dueño from mascota as m
	inner join raza as r on m.fk_idRaza = r.idRaza
    left join tipo_mascota as tpM on m.fk_idTipo_Mascota = tpM.idTipoMascota
    left join usuario as u on m.fk_idUsuario = u.idUsuario
    where tpM.tipoMascota = tipoMascota and r.nombreRaza = raza_mascota 
          and m.generoMascota = genero and m.estadoMascota = estado and
          m.edadMascota = edad;
    
END$$

call reporte_mascota_filtro("Perro", "Pincher", "Hembra", "Adoptado", 2);

DELIMITER $$
DROP PROCEDURE IF EXISTS `reporte_usuario` $$
create procedure `reporte_usuario`(
) 
begin

	select u.nombreUsuario as Usuario, u.estadoUsuario as Estado, p.nombrePersona as Nombre, p.apellidoPersona as Apellido, 
		   p.telefonoPersona as Telefono, p.ubicacionPersona as Ubicacion, p.correoPersona as Correo
	from Usuario as u
	inner join Persona as p on u.fk_idPersona = p.idPersona
    right join Roles as r on u.fk_idRol = r.idRol
    ;
    
END$$

call reporte_usuario();

DELIMITER $$
DROP PROCEDURE IF EXISTS `reporte_Persona` $$
create procedure `reporte_Persona`(
) 
begin

	select p.nombrePersona as Nombre, p.apellidoPersona as Apellido, p.edadPersona as Edad,
		   p.telefonoPersona as Telefono, p.ubicacionPersona as Ubicacion, p.correoPersona as Correo, tpd.tipoDocumento
	from Persona as p
    inner join Tipo_Documento as tpd on p.fk_idTipoDocumento = tpd.idTipoDocumento
    ;
    
END$$

call reporte_Persona();

/*----------------------------------------Procedimientos para reportes--------------------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `genero_mascota` $$
create procedure `genero_mascota`(
) 
begin
	select m.generoMascota from mascota as m
    group by m.generoMascota;
END$$

call genero_mascota();

DELIMITER $$
DROP PROCEDURE IF EXISTS `estado_mascota` $$
create procedure `estado_mascota`(
) 
begin
	select m.estadoMascota from mascota as m
    group by m.estadoMascota;
END$$

call estado_mascota();

DELIMITER $$
DROP PROCEDURE IF EXISTS `edad_mascota` $$
create procedure `edad_mascota`(
) 
begin
	select m.edadMascota from mascota as m
    group by m.edadMascota;
END$$

call edad_mascota();


