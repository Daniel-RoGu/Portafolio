
DELIMITER //
DROP PROCEDURE IF EXISTS `listar_permisos_carpetaRaiz` //
create procedure `listar_permisos_carpetaRaiz`(
id_usuario int
)
begin
	select pr.vista_raiz from usuario as u
    inner join roles as r on u.fk_idRol = r.idRol
    inner join permisos_roles as pr on pr.fk_idRol = r.idRol
    where  u.idUsuario = id_usuario
    group by pr.vista_raiz;
END//
DELIMITER;

DELIMITER //
DROP PROCEDURE IF EXISTS `listar_permisos_vistasCarpeta` //
create procedure `listar_permisos_vistasCarpeta`(
id_usuario int
)
begin
	select pr.vista from usuario as u
    inner join roles as r on u.fk_idRol = r.idRol
    inner join permisos_roles as pr on pr.fk_idRol = r.idRol
    where  u.idUsuario = id_usuario
    order by pr.vista_raiz asc;
END//

DELIMITER //
DROP PROCEDURE IF EXISTS `listar_permisos_vistasURL` //
create procedure `listar_permisos_vistasURL`(
id_usuario int
)
begin
	select concat(pr.vista_raiz, pr.vista) as URL from usuario as u
    inner join roles as r on u.fk_idRol = r.idRol
    inner join permisos_roles as pr on pr.fk_idRol = r.idRol
    where  u.idUsuario = id_usuario;
END//

DELIMITER //
DROP PROCEDURE IF EXISTS `navegacion_por_usuario` //
create procedure `navegacion_por_usuario`(
id_usuario int
)
begin
	select pr.vista_raiz as Carpeta_raiz, pr.vista, concat(pr.vista_raiz, pr.vista) as URL from usuario as u
    inner join roles as r on u.fk_idRol = r.idRol
    inner join permisos_roles as pr on pr.fk_idRol = r.idRol
    where  u.idUsuario = id_usuario;
END//

DELIMITER //
DROP PROCEDURE IF EXISTS `vistas_por_carpeta` //
create procedure `vistas_por_carpeta`(
id_usuario int,
nombre_carpeta varchar(80)
)
begin
	select pr.vista, concat(pr.vista_raiz, pr.vista) as URL from usuario as u
    inner join roles as r on u.fk_idRol = r.idRol
    inner join permisos_roles as pr on pr.fk_idRol = r.idRol
    where  u.idUsuario = id_usuario and pr.vista_raiz = nombre_carpeta;
END//

select pr.vista, concat(pr.vista_raiz, pr.vista) as URL from usuario as u
    inner join roles as r on u.fk_idRol = r.idRol
    inner join permisos_roles as pr on pr.fk_idRol = r.idRol
    where  u.idUsuario = 400 and pr.vista_raiz = "../Adopcion";