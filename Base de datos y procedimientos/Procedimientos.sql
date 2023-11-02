use adopciones;

-- -----------------------------------------------------
-- Procedimientos Almacenados
-- -----------------------------------------------------

/*-------------------------------------------------------Tipo Mascota------------------------------------------------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `listar_tp_mascota` $$
create procedure `listar_tp_mascota`() 
begin
	select * from Tipo_Mascota;
END$$
DELIMITER;

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtener_tp_mascota` $$
create procedure `obtener_tp_mascota`(
id_Tipo_Mascota int)
begin
	select * from Tipo_Mascota where idTipoMascota = id_Tipo_Mascota;
END$$
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `insertar_tp_mascota` //
create procedure `insertar_tp_mascota`(
    tipoMacota varchar(45),
    estadoTpMascota varchar(20)
)
begin
	insert into Tipo_Mascota (`tipoMascota`, `estadoTipoMascota`) values (tipoMacota, estadoTpMascota);
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `editar_tp_mascota` //
create procedure `editar_tp_mascota`(
	idTipo_Mascota int,
    tipoMacota varchar(45),
    estadoTpMascota varchar(20)
)
begin
	update Tipo_Mascota set `tipoMascota` = tipoMacota, `estadoTipoMascota` = estadoTpMascota where `idTipoMascota` = idTipo_Mascota;
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `eliminar_tp_mascota` //
create procedure `eliminar_tp_mascota`(
	idTipo_Mascota int
)
begin
	delete from Tipo_Mascota where `idTipoMascota` = idTipo_Mascota;
END//
DELIMITER;

/*-------------------------------------------------------Tipo Documento------------------------------------------------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `listar_tp_documento` $$
create procedure `listar_tp_documento`() 
begin
	select * from Tipo_Documento;
END$$
DELIMITER;

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtener_tp_documento` $$
create procedure `obtener_tp_documento`(
id_Tipo_Documento int) 
begin
	select * from Tipo_Documento where idTipoDocumento = id_Tipo_Documento;
END$$
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `insertar_tp_documento` //
create procedure `insertar_tp_documento`(
    tipo_Documento varchar(45),
    estadoTpDocumento varchar(20)
)
begin
	insert into Tipo_Documento (`tipoDocumento`, `estadoDocumento`) values (tipo_Documento, estadoTpDocumento);
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `editar_tp_documento` //
create procedure `editar_tp_documento`(
	idTipo_Documento int,
    tipo_Documento varchar(45),
    estadoTpDocumento varchar(20)
)
begin
	update Tipo_Documento set `tipoDocumento` = tipo_Documento, `estadoDocumento` = estadoTpDocumento where `idTipoDocumento` = idTipo_Documento;
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `eliminar_tp_documento` //
create procedure `eliminar_tp_documento`(
	idTipo_Documento int
)
begin
	delete from Tipo_Documento where `idTipoDocumento` = idTipo_Documento;
END//

/*---------------------------------------------------------------- Roles ------------------------------------------------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `listar_rol` $$
create procedure `listar_rol`() 
begin
	select * from Roles;
END$$
DELIMITER;

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtener_rol` $$
create procedure `obtener_rol`(
id_Rol int) 
begin
	select * from Roles where idRol = id_Rol;
END$$
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `insertar_rol` //
create procedure `insertar_rol`(
    nombre_Rol varchar(45),
    estado_Rol varchar(20)
)
begin
	insert into Roles (`nombreRol`, `estadoRol`) values (nombre_Rol, estado_Rol);
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `editar_rol` //
create procedure `editar_rol`(
	id_Rol int,
    nombre_Rol varchar(45),
    estado_Rol varchar(20)
)
begin
	update Roles set `nombreRol` = nombre_Rol, `estadoRol` = estado_Rol where `idRol` = id_Rol;
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `eliminar_rol` //
create procedure `eliminar_rol`(
	id_Rol int
)
begin
	delete from Roles where `idRol` = id_Rol;
END//

/*---------------------------------------------------------------- Raza ------------------------------------------------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `listar_raza` $$
create procedure `listar_raza`() 
begin
	select * from Raza;
END$$
DELIMITER;

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtener_raza` $$
create procedure `obtener_raza`(
id_Raza int) 
begin
	select * from Raza where idRaza = id_Raza;
END$$
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `insertar_raza` //
create procedure `insertar_raza`(
    nombre_Raza varchar(45),
    estado_Raza varchar(20)
)
begin
	insert into Raza (`nombreRaza`, `estadoRaza`) values (nombre_Raza, estado_Raza);
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `editar_raza` //
create procedure `editar_raza`(
	id_Raza int,
    nombre_Raza varchar(45),
    estado_Raza varchar(20)
)
begin
	update Raza set `nombreRaza` = nombre_Raza, `estadoRaza` = estado_Raza where `idRaza` = id_Raza;
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `eliminar_raza` //
create procedure `eliminar_raza`(
	id_Raza int
)
begin
	delete from Raza where `idRaza` = id_Raza;
END//

/*---------------------------------------------------------------- Permisos ------------------------------------------------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `listar_permiso` $$
create procedure `listar_permiso`() 
begin
	select * from Permisos;
END$$
DELIMITER;

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtener_permiso` $$
create procedure `obtener_permiso`(
id_Permiso int) 
begin
	select * from Permisos where idPermisos = id_Permiso;
END$$
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `insertar_permiso` //
create procedure `insertar_permiso`(
    nombre_Permiso varchar(45)
)
begin
	insert into Permisos (`nombrePermiso`, `estadoPermiso`) values (nombre_Permiso, "Activo");
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `editar_permiso` //
create procedure `editar_permiso`(
	id_Permiso int,
    nombre_Permiso varchar(45),
    estado_Permiso varchar(20)
)
begin
	update Permisos set `nombrePermiso` = nombre_Permiso, `estadoPermiso` = estado_Permiso where `idPermisos` = id_Permiso;
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `eliminar_permiso` //
create procedure `eliminar_permiso`(
	id_Permiso int
)
begin
	delete from Permisos where `idPermisos` = id_Permiso;
END//

/*---------------------------------------------------------- Permisos_Roles ------------------------------------------------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `listar_permisos_roles` $$
create procedure `listar_permisos_roles`() 
begin
	select * from Permisos_Roles;
END$$
DELIMITER;

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtener_permisos_roles` $$
create procedure `obtener_permisos_roles`(
fk_id_Permiso int,
fk_id_Rol int
) 
begin
	select * from Permisos_Roles where fk_idPermiso = fk_id_Permisos and fk_idRol = fk_id_Rol;
END$$
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `insertar_permisos_roles` //
create procedure `insertar_permisos_roles`(
fk_id_Permiso int,
fk_id_Rol int,
vista varchar(80)
)
begin
	insert into Permisos_Roles (`fk_idPermisos`, `fk_idRol`, `vista_raiz`, `vista`) values (fk_id_Permiso, fk_id_Rol, 
							(select permisos.nombrePermiso from permisos where permisos.idPermisos = fk_id_Permiso), vista);
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `editar_permisos_roles` //
create procedure `editar_permisos_roles`(
fk_id_Permiso int,
fk_id_Rol int
)
begin
	update Permisos_Roles set `url` = (select permisos.nombrePermiso from permisos where idPermisos = fk_id_Permiso) 
					where `fk_idPermisos` = fk_id_Permiso;
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `eliminar_permisos_roles` //
create procedure `eliminar_permisos_roles`(
fk_id_Permiso int,
fk_id_Rol int
)
begin
	delete from Permisos_Roles where `fk_idPermisos` = fk_id_Permiso and `fk_idRol` = fk_id_Rol;
END//

/*--------------------------------------------------------------- Persona -----------------------------------------------------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `listar_persona` $$
create procedure `listar_persona`() 
begin
	select * from Persona;
END$$
DELIMITER;

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtener_persona` $$
create procedure `obtener_persona`(
id_Persona INT
) 
begin
	select * from Persona where idPersona = id_Persona;
END$$
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `insertar_persona` //
create procedure `insertar_persona`(
idPersona int,
nombre_Persona VARCHAR(45),
apellido_Persona VARCHAR(45),
edad_Persona INT,
telefono_Persona VARCHAR(10),
ubicacion_Persona VARCHAR(45),
correo_Persona VARCHAR(45),
TpDocumento int,
nombreUsuario varchar(80),
contrasenaUsuario varchar(250)
)
begin
	if (!exists(select p.IdPersona from persona as p where p.IdPersona=idPersona)
	   and !exists(select u.nombreUsuario from usuario as u where u.nombreUsuario=nombreUsuario)
       and !exists(select p.correoPersona from persona as p where p.correoPersona=correo_Persona)) 
    then
		if(edad_Persona > 18 and TpDocumento = 201)
        then
			set TpDocumento = 200;
        elseif (edad_Persona < 18 and TpDocumento = 200)
        then
			set TpDocumento = 201;
        end if;
		insert into Persona (`idPersona`, `nombrePersona`, `apellidoPersona`, `edadPersona`, `telefonoPersona`, 
                         `ubicacionPersona`, `correoPersona`, `fk_idTipoDocumento`) values (idPersona, nombre_Persona, apellido_Persona,
                                edad_Persona, telefono_Persona, ubicacion_Persona, correo_Persona, TpDocumento);
                                
		insert into Usuario (`nombreUsuario`, `contrasenaUsuario`, `estadoUsuario`, `fk_idRol`, `fk_idPersona`) values (nombreUsuario, contrasenaUsuario, "Activo", 100, idPersona);
    end if;
END//
DELIMITER;
 
 
DELIMITER //
DROP PROCEDURE IF EXISTS `editar_persona` //
create procedure `editar_persona`(
id_Persona INT,
nombre_Persona VARCHAR(45),
apellido_Persona VARCHAR(45),
edad_Persona INT,
telefono_Persona VARCHAR(10),
ubicacion_Persona VARCHAR(45),
correo_Persona VARCHAR(45),
TpDocumento int
)
begin
    update Persona set `nombrePersona` = nombre_Persona, `apellidoPersona`= apellido_Persona, 
                                `edadPersona`= edad_Persona, `telefonoPersona` = telefono_Persona, `ubicacionPersona` = ubicacion_Persona, 
                                `correoPersona` = correo_Persona, `fk_idTipoDocumento` =  TpDocumento 
                          where `idPersona` = id_Persona;
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `eliminar_persona` //
create procedure `eliminar_persona`(
id_Persona int
)
begin
	declare  idUs int;
    set idUs = (select u.idUsuario from Usuario as u where u.fk_idPersona = id_Persona);
    call eliminar_usuario(idUs);
	delete from Persona where `idPersona` = id_Persona;
END//

DELIMITER //
DROP PROCEDURE IF EXISTS `obtener_fkIdTipoDocumento` //
create procedure `obtener_fkIdTipoDocumento`(id_Persona INT
) 
begin
    select Persona.fk_idTipoDocumento from Persona where idPersona = id_Persona;
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `obtener_rol_persona` //
CREATE PROCEDURE `obtener_rol_persona`(
usu varchar(80),
pass varchar(250)
)
begin
	select idPersona, nombreRol, nombreUsuario, idUsuario from persona as p
	inner join usuario as u on p.idPersona = u.fk_idPersona
	inner join Roles as r 
	on r.idRol = u.fk_idRol
	where usu = u.nombreUsuario and pass= u.contrasenaUsuario;
END//
DELIMITER;


DELIMITER $$
DROP PROCEDURE IF EXISTS `obtener_usuariopersona` $$
create procedure `obtener_usuariopersona`(
id_usuario INT
)
begin
    select Persona.idPersona from Persona where Persona.idPersona = (select Usuario.fk_idPersona from Usuario
                                                                     where Usuario.idUsuario = id_usuario);
END$$
DELIMITER;
/*--------------------------------------------------------------- Usuario -----------------------------------------------------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `listar_usuario` $$
create procedure `listar_usuario`() 
begin
	select * from Usuario;
END$$
DELIMITER;

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtener_usuario` $$
create procedure `obtener_usuario`(
id_Usuario INT
) 
begin
	select * from Usuario where `idUsuario` = id_Usuaio;
END$$
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `insertar_usuario` //
create procedure `insertar_usuario`(
nombre_Usuario VARCHAR(45),
contrasena_Usuario VARCHAR(45),
nombre VARCHAR(45)
)
begin
	declare idRol int;
    declare idPersona int;
    declare estado_cuenta varchar(40);
    set estado_cuenta = "Adopta";
    set idPersona = (select Persona.idPersona from persona where persona.nombrePersona = nombre);
    set idRol = (select Roles.idRol from roles where estado_cuenta = "Adopta" and roles.nombreRol = "ClienteAdopta");   
													
	insert into Usuario (`nombreUsuario`, `contrasenaUsuario`, `estadoUsuario`, `fk_idRol`, 
						 `fk_idPersona`) values (nombre_Usuario, contrasena_Usuario,
						 "Activo", idRol, idPersona);
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `editar_usuario` //
create procedure `editar_usuario`(
id_Usuario INT,
nombre_Usuario VARCHAR(45),
contrasena_Usuario VARCHAR(45),
estado_Usuario VARCHAR(45),
estado_Cuenta VARCHAR(45),
nombre VARCHAR(45)
)
begin
	declare idRol int;
    declare idPersona int;
    set idPersona = (select Persona.idPersona from persona where persona.nombrePersona = nombre);
    set idRol = (select Roles.idRol from roles where estado_cuenta = "noAdopta" and roles.nombreRol = "ClienteAdopta" or
				 estado_cuenta = "Adopta" and roles.nombreRol = "ClienteNoAdopta"); 
	update Usuario set `nombreUsuario` = nombre_Usuario, `contrasenaUsuaio`= contrasena_Usuario, 
								`estadoUsuario`= estado_Usuario, `fk_idRol` = idRol, `fk_idPersona` = idPersona
						  where `idUsuario` = id_Usuario;
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `eliminar_usuario` //
create procedure `eliminar_usuario`(
id_Usuario int
)
begin
	delete from Usuario where `idUsuario` = id_Usuario;
END//

/*---------------------------------------------------------- Vacunas ------------------------------------------------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `listar_vacunas` $$
create procedure `listar_vacunas`() 
begin
	select * from Vacunas;
END$$
DELIMITER;

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtener_vacunas` $$
create procedure `obtener_vacunas`(
id_vacunas int
) 
begin
	select * from Vacunas where `idVacunas` = id_vacunas;
END$$
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `insertar_vacunas` //
create procedure `insertar_vacunas`(
nombreVacuna VARCHAR(45),
estadoVacuna VARCHAR(45)
)
begin
	insert into Vacunas (`nombreVacuna`, `estadoVacuna`) values (nombreVacuna, estadoVacuna);
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `editar_vacuna` //
create procedure `editar_vacuna`(
idVacunas INT,
nombreVacuna VARCHAR(45),
estadoVacuna VARCHAR(45)
)
begin
	update Vacunas set `nombreVacuna` = nombreVacuna, `estadoVacuna` = estadoVacuna where Vacunas.`idVacunas` = idVacunas;
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `eliminar_vacuna` //
create procedure `eliminar_vacuna`(
idVacunas int
)
begin
	delete from Vacunas where Vacunas.`idVacunas` = idVacunas;
END//

/*--------------------------------------------------------------- Adopcion -----------------------------------------------------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `listar_adopcion` $$
create procedure `listar_adopcion`() 
begin
	select Adopcion.*, Macota.`nombreMascota` from Adopcion inner join Mascota on Adopcion.`idAdopcion` = Mascota.`fk_idAdopcion`;
END$$
DELIMITER;

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtener_adopcion` $$
create procedure `obtener_adopcion`(
nombre_mascota varchar(20)
) 
begin
	select Adopcion.*, Mascota.`nombreMascota` from Adopcion inner join Mascota on Adopcion.`fk_idMascota` = Mascota.`idMascota`
    where adopcion.fk_idMascota = (select `idMascota` from Mascota where Mascota.`nombreMascota` = nombre_mascota);
END$$
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `insertar_adopcion` //
create procedure `insertar_adopcion`(
id_mascota int,
idUsuario int
)
begin
declare id int;
    insert into Adopcion (`fechaInicioAdopcion`, `fechaFinAdopcion`, `estadoAdopcion`, `fk_idMascota`)
                        values (DATE(NOW()), '01/01/23', "Activo", id_mascota);
    set id = (SELECT LAST_INSERT_ID());        
    insert into control_adopcion(fk_idUsuario,fk_idAdopcion,nombreProceso) 
    value (idUsuario,id,"En proceso");
END//
DELIMITER;

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtener_idAdopcionMascotaUsuario` $$
create procedure `obtener_idAdopcionMascotaUsuario`(
nombre_mascota varchar(20),
id_usuario int
) 
begin
	select a.idAdopcion from adopcion as a
	inner join control_adopcion as ca on a.idAdopcion = ca.fk_idAdopcion
	inner join usuario as u on ca.fk_idUsuario = id_usuario
	left join mascota as m on a.fk_idMascota = m.idMascota
	where m.nombreMascota = nombre_mascota
	order by a.idAdopcion limit 1;
END$$
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `estadoAdopcionAprobado` //
create procedure `estadoAdopcionAprobado`(
idAdopcion int,
validacion bool
)
begin
	declare idUsuario int;
	declare id_ca int;
    declare id_a int;
    declare fk_idM int;
    set idUsuario = (select ca.fk_idUsuario from control_adopcion as ca
					 where ca.fk_idAdopcion = idAdopcion);
    set id_ca = (select `Control_Adopcion`.`idControlAdopcion` from `Control_Adopcion` 
			     where `Control_Adopcion`.`fk_idUsuario` = idUsuario 
                 and `Control_Adopcion`.`fk_idAdopcion` = idAdopcion);
    set id_a = (select a.idAdopcion from adopcion as a 
			   inner join control_adopcion as ca on ca.fk_idAdopcion = a.idAdopcion
			   where ca.fk_idUsuario = idUsuario and a.idAdopcion = idAdopcion);             
    set fk_idM = (select a.fk_idMascota from adopcion as a
				  left join mascota as m on a.fk_idMascota = m.idMascota
				  inner join control_adopcion as ca on ca.fk_idAdopcion = a.idAdopcion
				  and ca.fk_idUsuario = idUsuario where a.idAdopcion = idAdopcion);
	if (validacion = true) then
		update `Control_Adopcion` set `Control_Adopcion`.`nombreProceso` = "Aprobado" 
							      where `Control_Adopcion`.`idControlAdopcion` = id_ca;
        update adopcion as a set a.estadoAdopcion = "Finalizado", a.fechaFinAdopcion = (date(now())) 
							 where a.idAdopcion = id_a;
		update mascota as m set m.estadoMascota = "Adoptado" where m.idMascota = fk_idM;
	end if;
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `estadoAdopcionRechazado` //
create procedure `estadoAdopcionRechazado`(
idAdopcion int,
validacion bool
)
begin
	declare idUsuario int;
	declare id_ca int;
    declare id_a int;
    declare fk_idM int;
    set idUsuario = (select ca.fk_idUsuario from control_adopcion as ca
					 where ca.fk_idAdopcion = idAdopcion);
    set id_ca = (select `Control_Adopcion`.`idControlAdopcion` from `Control_Adopcion` 
			     where `Control_Adopcion`.`fk_idUsuario` = idUsuario 
                 and `Control_Adopcion`.`fk_idAdopcion` = idAdopcion);
    set id_a = (select a.idAdopcion from adopcion as a 
			   inner join control_adopcion as ca on ca.fk_idAdopcion = a.idAdopcion
			   where ca.fk_idUsuario = idUsuario and a.idAdopcion = idAdopcion);             
    set fk_idM = (select a.fk_idMascota from adopcion as a
				  left join mascota as m on a.fk_idMascota = m.idMascota
				  inner join control_adopcion as ca on ca.fk_idAdopcion = a.idAdopcion
				  and ca.fk_idUsuario = idUsuario where a.idAdopcion = idAdopcion);
	if (validacion = true) then
		update `Control_Adopcion` set `Control_Adopcion`.`nombreProceso` = "Rechazado" 
							      where `Control_Adopcion`.`idControlAdopcion` = id_ca;
        update adopcion as a set a.estadoAdopcion = "Finalizado", a.fechaFinAdopcion = (date(now())) 
							 where a.idAdopcion = id_a;
		update mascota as m set m.estadoMascota = "Activo" where m.idMascota = fk_idM;
	end if;
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `eliminar_adopcion` //
create procedure `eliminar_adopcion`(
id_adopcion int
)
begin
	delete from Adopcion where `idAdopcion` = id_Adopcion;
END//



/*--------------------------------------------------------------- Mascota -----------------------------------------------------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `listar_mascota` $$
create procedure `listar_mascota`() 
begin
	select * from Mascota;
END$$
DELIMITER;

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtener_mascota` $$
create procedure `obtener_mascota`(
id_Mascota INT
) 
begin
	select idMascota, nombreMascota, edadMascota from mascota
    where fk_idUsuario = idUsuario;
END$$
DELIMITER;

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtener_mascotaTodo` $$
create procedure `obtener_mascotaTodo`(
id_Mascota INT
) 
begin
	select * from Mascota where `idMascota` = id_Mascota;
END$$
DELIMITER;

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtener_mascota_NoMia` $$
create procedure `obtener_mascota_NoMia`(
id_Usuario INT
) 
begin
	select m.* from Mascota as m where m.fk_idUsuario != id_Usuario;
END$$
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `insertar_mascota` //
create procedure `insertar_mascota`(
nombreMascota VARCHAR(45),
edadMascota INT,
pesoMascota INT,
generoMascota VARCHAR(10),
observaciones VARCHAR(80),
raza INT,
tpMascota INT,
Usuario_pertenece INT,
imagen LONGBLOB
)
begin	
	insert into Mascota (`nombreMascota`, `edadMascota`, `pesoMascota`, `generoMascota`, `observaciones`, `estadoMascota`, 
						 `fk_idRaza`, `fk_idTipo_Mascota`, `fk_idUsuario`, `imagen`) 
						values 
						(nombreMascota, edadMascota, pesoMascota, generoMascota, observaciones, "Activo", raza,
                         tpMascota, Usuario_pertenece, imagen);
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `editar_mascota` //
create procedure `editar_mascota`(
idMascota INT,
nombreMascota VARCHAR(45),
edadMascota INT,
pesoMascota INT,
observaciones VARCHAR(80),
estadoMascota VARCHAR(20)
)
begin
    update mascota as m set m.`nombreMascota` = nombreMascota, m.`edadMascota`= edadMascota, m.`pesoMascota` = pesoMascota, m.`observaciones`= observaciones,
    m.`estadoMascota` = estadoMascota where m.`idMascota` = idMascota;
END//
DELIMITER;
/*MODIFICAR NO ES NECESARIO, CON EL ON DELETE CASCADE ES SUFICIENTE*/
DELIMITER //
DROP PROCEDURE IF EXISTS `eliminar_mascota` //
create procedure `eliminar_mascota`(
id_Mascota int
)
begin
	declare idA int;
    declare idCA int;
    set idA = (select a.idAdopcion from Adopcion as a where id_Mascota = a.fk_idMascota);
    set idCA = (select ca.fk_idAdopcion from Control_Adopcion as ca where idA = ca.fk_idAdopcion);
    call eliminar_mascotaControlAdopcion(idCA);
    call eliminar_adopcion(idA);
	delete from Mascota where `idMascota` = id_Mascota;
END//

DELIMITER //
DROP PROCEDURE IF EXISTS `eliminar_mascotaControlAdopcion` //
create procedure `eliminar_mascotaControlAdopcion`(
id_adopcion int
)
begin
	delete from control_adopcion where `fk_idAdopcion` = id_adopcion;
END//

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtener_mascota_nombreRaza` $$
create procedure `obtener_mascota_nombreRaza`(
id_Mascota INT
) 
begin
    select Raza.nombreRaza from Raza
    inner join Mascota on Mascota.IdMascota = id_Mascota 
    where Raza.`idRaza` = Mascota.`fk_idRaza`;
END$$
DELIMITER;
 
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtener_mascota_tipo` $$
create procedure `obtener_mascota_tipo`(
id_Mascota INT
) 
begin
    select Tipo_Mascota.tipoMascota from Tipo_Mascota
    inner join Mascota on Mascota.IdMascota = id_Mascota 
    where Tipo_Mascota.`idTipoMascota` = Mascota.`fk_idTipo_Mascota`;
END$$
DELIMITER;
 
DELIMITER $$
DROP PROCEDURE IF EXISTS `obtener_mascota_dueño` $$
create procedure `obtener_mascota_dueño`(
id_Mascota INT
) 
begin
    select Usuario.nombreUsuario from Usuario
    inner join Mascota on Mascota.IdMascota = id_Mascota 
    where Usuario.`idUsuario` = Mascota.`fk_idUsuario`;
END$$
DELIMITER;

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtener_mascota_usuario` $$
create procedure `obtener_mascota_usuario`(
idUsuario INT
) 
begin
	select idMascota, nombreMascota, edadMascota from usuario as u
    inner join mascota as m
    on u.idUsuario = m.fk_idUsuario
    where u.idUsuario = idUsuario;
END$$
DELIMITER;
/*---------------------------------------------------------- Vacunas_Mascota ------------------------------------------------------------------*/

DELIMITER $$
DROP PROCEDURE IF EXISTS `listar_mascota_vacunas` $$
create procedure `listar_mascota_vacunas`() 
begin
	select * from Mascota_Vacunas;
END$$
DELIMITER;

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtener_mascota_vacunas` $$
create procedure `obtener_mascota_vacunas`(
fkidMascota INT,
fkidVacunas INT
) 
begin
	select * from Mascota_Vacunas where Mascota_Vacunas.`fk_idMascota` = fkidMascota and Mascota_Vacunas.`fk_idVacunas` = fkidVacunas;
END$$
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `insertar_mascota_vacunas` //
create procedure `insertar_mascota_vacunas`(
fk_idMascota INT,
fk_idVacunas INT,
fechaVacuna varchar(40)
)
begin
    declare vacunas varchar(40);
    set vacunas = (select Vacunas.nombreVacuna from Vacunas where Vacunas.idVacunas = fk_idVacunas);
    insert into Mascota_Vacunas (`fk_idMascota`, `fk_idVacunas`, `fechaVacuna`, `Vacunas`)
                        values (fk_idMascota, fk_idVacunas, fechaVacuna, vacunas);
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `editar_mascota_vacunas` //
create procedure `editar_mascota_vacunas`(
fk_idMascota INT,
fk_idVacunas INT,
fechaVacuna DATE,
vacunas varchar(40)
)
begin
	update Mascota_Vacunas set `Vacunas` = vacunas, `fechaVacuna` = fechaVacuna 
						   where `fk_idMascota` = fk_idMascota and `fk_idVacunas` = fk_idVacunas;
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `eliminar_mascota_vacunas` //
create procedure `eliminar_mascota_vacunas`(
fk_idMascota INT,
fk_idVacunas INT
)
begin
	delete from Mascota_Vacunas where `fk_idMascota` = fk_idMascota and `fk_idVacunas` = fk_idVacunas;
END//

/*---------------------------------------------------------- Control_Adopcion ------------------------------------------------------------------*/

 

DELIMITER $$
DROP PROCEDURE IF EXISTS `listar_Control_adopcion` $$
create procedure `listar_Control_adopcion`() 
begin
    select Usuario.nombreUsuario, Mascota.nombreMascota, Control_Adopcion.nombreProceso from Usuario
    inner join Mascota on Mascota.fk_idUsuario = Usuario.idUsuario
    inner join Adopcion on Adopcion.fk_idMascota = Mascota.idMascota
    inner join Control_Adopcion on Control_Adopcion.fk_idAdopcion = Adopcion.idAdopcion and Control_Adopcion.fk_idUsuario = Usuario.idUsuario
    where Usuario.idUsuario = Mascota.fk_idUsuario;
    
    select Usuario.nombreUsuario, Mascota.nombreMascota, Control_Adopcion.nombreProceso from Usuario
    inner join Control_Adopcion on Control_Adopcion.fk_idUsuario = Usuario.idUsuario
    inner join Adopcion on Adopcion.idAdopcion = Control_Adopcion.fk_idAdopcion
    inner join Mascota on Mascota.idMascota = Adopcion.fk_idMascota 
    where Usuario.idUsuario = Mascota.fk_idUsuario;
END$$
DELIMITER;

 

DELIMITER $$
DROP PROCEDURE IF EXISTS `obtener_Control_adopcion` $$
create procedure `obtener_Control_adopcion`(
idUsuario INT
) 
begin
    /*para el dueño*/
    select Usuario.nombreUsuario, Mascota.nombreMascota, Control_Adopcion.nombreProceso from Usuario
    inner join Mascota on Mascota.fk_idUsuario = idUsuario
    inner join Adopcion on Adopcion.fk_idMascota = Mascota.idMascota
    inner join Control_Adopcion on Control_Adopcion.fk_idAdopcion = Adopcion.idAdopcion and Control_Adopcion.fk_idUsuario = Usuario.idUsuario
    where Usuario.idUsuario = Mascota.fk_idUsuario;
    
    /*para el que solicita*/
    select Usuario.nombreUsuario, Mascota.nombreMascota, Control_Adopcion.nombreProceso from Usuario
    inner join Control_Adopcion on Control_Adopcion.fk_idUsuario = idUsuario
    inner join Adopcion on Adopcion.idAdopcion = Control_Adopcion.fk_idAdopcion
    inner join Mascota on Mascota.idMascota = Adopcion.fk_idMascota 
    where Usuario.idUsuario = Mascota.fk_idUsuario;
END$$
DELIMITER;

 

DELIMITER //
DROP PROCEDURE IF EXISTS `insertar_Control_adopcion` //
create procedure `insertar_Control_adopcion`(
fk_idUsuario INT,
fk_idAdopcion INT
)
begin
    insert into Control_Adopcion (`fk_idUsuario`, `fk_idAdopcion`, `nombreProceso`) 
                        values (fk_idUsuario, fk_idAdopcion, "En proceso");
END//
DELIMITER;

 DELIMITER //
DROP PROCEDURE IF EXISTS `estados_adop` //
create procedure `estados_adop`(
fk_idUsuario INT,
fk_idAdopcion INT
)
begin
declare estadoa varchar(40);
declare estadom varchar(40);
declare nombre_proceso varchar(40);
declare estado_adopcion varchar(40);
set nombre_proceso = (select ca.nombreProceso from control_adopcion as ca
inner join Adopcion as a on a.idAdopcion = ca.fk_idAdopcion
where ca.fk_idUsuario = fk_idUsuario);
set estadoa = (if(nombre_proceso="Aprobado" || nombre_proceso="Rechazado", "Finalizado", "Activo"));
update Adopcion as a set a.`estadoAdopcion` = estadoa;

set estado_adopcion = (select a.estadoAdopcion from Adopcion as a
inner join Mascota as m on m.idMascota = a.fk_idMascota);
set estadom = (if(a.estadoAdopcion="Finalizado", "Adoptado", "Activo"));
update Mascota as m set m.`estadoMascota` = estadom;
END//
DELIMITER;

/*---------------------------------------------------------- mascota_vacunas ------------------------------------------------------------------*/

 
DELIMITER //
DROP PROCEDURE IF EXISTS `editar_mascota_vacunas` //
create procedure `editar_mascota_vacunas`(
fk_idUsuario INT,
fk_idAdopcion INT,
nombreProceso varchar(40)
)
begin
    update Control_Adopcion set `nombreProceso` = nombreProceso
                           where `fk_idUsuario` = fk_idUsuario and `fk_idAdopcion` = fk_idAdopcion;
END//
DELIMITER;

 

DELIMITER //
DROP PROCEDURE IF EXISTS `eliminar_mascota_vacunas` //
create procedure `eliminar_mascota_vacunas`(
fk_idUsuario INT,
fk_idAdopcion INT
)
begin
    delete from Control_Adopcion where `fk_idUsuario` = fk_idUsuario and `fk_idAdopcion` = fk_idAdopcion;
END//

DELIMITER $$
DROP PROCEDURE IF EXISTS `adopciones_publicadas` $$
create procedure `adopciones_publicadas`(
idUsuario INT
) 
begin
    /*para el dueño*/
	select a.idAdopcion, u.nombreUsuario, m.nombreMascota, ca.nombreProceso from control_adopcion as ca
	inner join adopcion as a on ca.fk_idAdopcion = a.idAdopcion
	inner join mascota as m on a.fk_idMascota = m.idMascota
	inner join usuario as u on m.fk_idUsuario = u.idUsuario
	where ca.fk_idUsuario = idUsuario and u.idUsuario != idUsuario;
END$$

DELIMITER $$
DROP PROCEDURE IF EXISTS `adopciones_solicitadas` $$
create procedure `adopciones_solicitadas`(
idUsuario int)
begin
    /*para el que solicita*/
    select Adopcion.idAdopcion, Usuario.nombreUsuario, Persona.telefonoPersona, Mascota.nombreMascota, Control_Adopcion.nombreProceso from Usuario
    left join Persona on Usuario.fk_idPersona = Persona.idPersona
    inner join Control_Adopcion on Control_Adopcion.fk_idUsuario = Usuario.idUsuario
    inner join Adopcion on Adopcion.idAdopcion = Control_Adopcion.fk_idAdopcion
    inner join Mascota on Mascota.idMascota = Adopcion.fk_idMascota and Mascota.fk_idUsuario = idUsuario
    where Usuario.idUsuario != Mascota.fk_idUsuario;
END$$


DELIMITER $$
DROP TRIGGER IF EXISTS actualizar_estados_mascota $$
CREATE TRIGGER actualizar_estados_mascota
after update
ON adopciones.Control_Adopcion
for each row
begin
	declare estadoA varchar(40);
    declare estadoM varchar(40);
	declare nombre_proceso varchar(40);
    declare estado_adopcion varchar(40);
    set nombre_proceso = (select ca.nombreProceso from control_adopcion as ca
                          inner join Adopcion as a on a.idAdopcion = ca.fk_idAdopcion);
    set estadoA = (if(nombre_proceso="Aprobado" || nombre_proceso="Rechazado", "Finalizado", "Activo"));
    update Adopcion as a set a.`estadoAdopcion` = estadoA;
   
    set estado_adopcion = (select a.estadoAdopcion from Adopcion as a
                          inner join Mascota as m on m.idMascota = a.fk_idMascota);
    set estadoM = (if(a.estadoAdopcion="Finalizado", "Adoptado", "Activo"));
    update Mascota as m set m.`estadoMascota` = estadoM;
   
end$$