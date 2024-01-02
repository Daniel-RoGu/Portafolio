USE `adopciones`;

CREATE VIEW info_Mascota_Adopcion AS
SELECT m.nombreMascota as Mascota, m.edadMascota as Años, m.pesoMascota as Kilos, a.nombreAdopta as Nuevo_Dueño, a.apellidoAdopta as Apellido, a.celularAdopta as Telefono
FROM Adopcion as a
inner join Mascota as m on a.fk_idMascota = m.idMascota
WHERE a.estadoAdopcion = "Aceptado";

select * from info_Mascota_Adopcion;

-- -----------------------------------------------------
-- Table `Auditoria_Adopcion_Update`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AuditoriaAdopciones` ;

CREATE TABLE IF NOT EXISTS `AuditoriaAdopciones` (
  `idAuditoriaAdopciones` INT NOT NULL AUTO_INCREMENT,
  `tabla_afectada` VARCHAR(45) NOT NULL,
  `tipo_accion` VARCHAR(45) NOT NULL,
  `id_registro_afectado` VARCHAR(45) NOT NULL,
  `usuario` VARCHAR(45) NOT NULL,
  `fecha_hora` DATE NOT NULL,
  PRIMARY KEY (`idAuditoriaAdopciones`));

ALTER TABLE `AuditoriaAdopciones` AUTO_INCREMENT = 4000;

select * from AuditoriaAdopciones;

/*-----Trigger para auditar sobre actualizaciones en la tabla Adopcion-----*/

DELIMITER //
CREATE TRIGGER auditoria_adopcion_update
AFTER UPDATE ON Adopcion
FOR EACH ROW
BEGIN
    INSERT INTO AuditoriaAdopciones (tabla_afectada, tipo_accion, id_registro_afectado, usuario, fecha_hora)
    VALUES ('Adopciones', 'UPDATE', OLD.idAdopcion, USER(), NOW());
END;
//
DELIMITER ;

/*-----Trigger para actualizar estado de la mascota cuando es adoptada-----*/

DELIMITER //
CREATE TRIGGER actualizar_estado_adopcion
AFTER UPDATE ON Adopcion
FOR EACH ROW
BEGIN
    update Mascota set estadoMascota = "Adoptada" 
    where new.estadoAdopcion = "Aceptado" and old.fk_idMascota = Mascota.idMascota;
END;
//
DELIMITER ;

