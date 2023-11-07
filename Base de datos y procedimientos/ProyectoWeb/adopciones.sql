
-- -----------------------------------------------------
-- Schema adopciones
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `adopciones` ;

-- -----------------------------------------------------
-- Schema adopciones
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `adopciones` DEFAULT CHARACTER SET utf8;
USE `adopciones`;

-- -----------------------------------------------------
-- Table `adopciones`.`Roles`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adopciones`.`Roles` (
  `idRol` INT NOT NULL AUTO_INCREMENT,
  `nombreRol` VARCHAR(45) NOT NULL,
  `estadoRol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRol`))
ENGINE = InnoDB;

ALTER TABLE Roles AUTO_INCREMENT = 100;
-- -----------------------------------------------------
-- Table `adopciones`.`Tipo_Documento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adopciones`.`Tipo_Documento` (
  `idTipoDocumento` INT NOT NULL AUTO_INCREMENT,
  `tipoDocumento` VARCHAR(45) NOT NULL,
  `estadoDocumento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoDocumento`))
ENGINE = InnoDB;

ALTER TABLE Tipo_Documento AUTO_INCREMENT = 200;
-- -----------------------------------------------------
-- Table `adopciones`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adopciones`.`Persona` (
  `idPersona` INT NOT NULL,
  `nombrePersona` VARCHAR(45) NOT NULL,
  `apellidoPersona` VARCHAR(45) NOT NULL,
  `edadPersona` INT NULL,
  `telefonoPersona` VARCHAR(10) NOT NULL,
  `ubicacionPersona` VARCHAR(45) NOT NULL,
  `correoPersona` VARCHAR(45) NOT NULL,
  `fk_idTipoDocumento` INT NOT NULL,
  PRIMARY KEY (`idPersona`),
  CONSTRAINT `fk_Persona_Tipo_Documento1`
    FOREIGN KEY (`fk_idTipoDocumento`)
    REFERENCES `adopciones`.`Tipo_Documento` (`idTipoDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `adopciones`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adopciones`.`Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombreUsuario` VARCHAR(45) NOT NULL,
  `contrasenaUsuario` VARCHAR(45) NOT NULL,
  `estadoUsuario` VARCHAR(45) NOT NULL,
  `fk_idRol` INT NOT NULL,
  `fk_idPersona` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  CONSTRAINT `fk_Usuario_Roles1`
    FOREIGN KEY (`fk_idRol`)
    REFERENCES `adopciones`.`Roles` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Persona1`
    FOREIGN KEY (`fk_idPersona`)
    REFERENCES `adopciones`.`Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

ALTER TABLE Usuario AUTO_INCREMENT = 400;
-- -----------------------------------------------------
-- Table `adopciones`.`Raza`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adopciones`.`Raza` (
  `idRaza` INT NOT NULL AUTO_INCREMENT,
  `nombreRaza` VARCHAR(45) NOT NULL,
  `estadoRaza` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRaza`))
ENGINE = InnoDB;

ALTER TABLE Raza AUTO_INCREMENT = 500;
-- -----------------------------------------------------
-- Table `adopciones`.`Tipo_Mascota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adopciones`.`Tipo_Mascota` (
  `idTipoMascota` INT NOT NULL AUTO_INCREMENT,
  `tipoMascota` VARCHAR(45) NOT NULL,
  `estadoTipoMascota` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idTipoMascota`))
ENGINE = InnoDB;

ALTER TABLE Tipo_Mascota AUTO_INCREMENT = 600;

-- -----------------------------------------------------
-- Table `adopciones`.`Mascota`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adopciones`.`Mascota` (
  `idMascota` INT NOT NULL AUTO_INCREMENT,
  `nombreMascota` VARCHAR(45) NULL,
  `edadMascota` INT NULL,
  `pesoMascota` INT NULL,
  `generoMascota` VARCHAR(10) NOT NULL,
  `observaciones` VARCHAR(80) NULL,
  `estadoMascota` VARCHAR(45) NOT NULL,
  `fk_idRaza` INT NULL,
  `fk_idTipo_Mascota` INT NOT NULL,
  `fk_idUsuario` INT NOT NULL,
  `imagen` LONGBLOB NULL,
  PRIMARY KEY (`idMascota`),
  CONSTRAINT `fk_Mascota_Raza1`
    FOREIGN KEY (`fk_idRaza`)
    REFERENCES `adopciones`.`Raza` (`idRaza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mascota_Tipo Mascota1`
    FOREIGN KEY (`fk_idTipo_Mascota`)
    REFERENCES `adopciones`.`Tipo_Mascota` (`idTipoMascota`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mascota_Usuario1`
    FOREIGN KEY (`fk_idUsuario`)
    REFERENCES `adopciones`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

ALTER TABLE Mascota AUTO_INCREMENT = 700;
-- -----------------------------------------------------
-- Table `adopciones`.`Vacunas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adopciones`.`Vacunas` (
  `idVacunas` INT NOT NULL AUTO_INCREMENT,
  `nombreVacuna` VARCHAR(45) NOT NULL,
  `estadoVacuna` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVacunas`))
ENGINE = InnoDB;

ALTER TABLE Vacunas AUTO_INCREMENT = 800;
-- -----------------------------------------------------
-- Table `adopciones`.`Mascota_Vacunas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adopciones`.`Mascota_Vacunas` (
  `idMascotaVacuna` INT NOT NULL AUTO_INCREMENT,
  `fk_idMascota` INT NOT NULL,
  `fk_idVacunas` INT NOT NULL,
  `fechaVacuna` DATE,
  `Vacuna` VARCHAR(45) NULL,
  PRIMARY KEY (`idMascotaVacuna`),
  CONSTRAINT `fk_Mascota_has_Vacunas_Mascota1`
    FOREIGN KEY (`fk_idMascota`)
    REFERENCES `adopciones`.`Mascota` (`idMascota`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mascota_has_Vacunas_Vacunas1`
    FOREIGN KEY (`fk_idVacunas`)
    REFERENCES `adopciones`.`Vacunas` (`idVacunas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

ALTER TABLE `Mascota_Vacunas` AUTO_INCREMENT = 1200;

-- -----------------------------------------------------
-- Table `adopciones`.`Permisos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adopciones`.`Permisos` (
  `idPermisos` INT NOT NULL AUTO_INCREMENT,
  `nombrePermiso` VARCHAR(45) NOT NULL,
  `estadoPermiso` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPermisos`))
ENGINE = InnoDB;

ALTER TABLE Permisos AUTO_INCREMENT = 900;

-- -----------------------------------------------------
-- Table `adopciones`.`Adopcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adopciones`.`Adopcion` (
  `idAdopcion` INT NOT NULL AUTO_INCREMENT,
  `fechaInicioAdopcion` DATE NOT NULL,
  `fechaFinAdopcion` DATE,
  `estadoAdopcion` VARCHAR(45) NOT NULL,
  `fk_idMascota` INT NOT NULL,
  PRIMARY KEY (`idAdopcion`),
  CONSTRAINT `fk_Adopcion_Mascota1`
    FOREIGN KEY (`fk_idMascota`)
    REFERENCES `adopciones`.`Mascota` (`idMascota`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

ALTER TABLE Adopcion AUTO_INCREMENT = 1000;
-- -----------------------------------------------------
-- Table `adopciones`.`Permisos_Roles`
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `adopciones`.`Permisos_Roles` (
  `idPermisosRoles` INT NOT NULL AUTO_INCREMENT,
  `fk_idPermisos` INT NOT NULL,
  `fk_idRol` INT NOT NULL,
  `vista_raiz` VARCHAR(45) NOT NULL,
  `vista` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPermisosRoles`),
  CONSTRAINT `fk_Permisos_has_Roles_Permisos1`
    FOREIGN KEY (`fk_idPermisos`)
    REFERENCES `adopciones`.`Permisos` (`idPermisos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Permisos_has_Roles_Roles1`
    FOREIGN KEY (`fk_idRol`)
    REFERENCES `adopciones`.`Roles` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

ALTER TABLE `Permisos_Roles` AUTO_INCREMENT = 1400;
-- -----------------------------------------------------
-- Table `adopciones`.`Control_Adopcion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `adopciones`.`Control_Adopcion` (
  `idControlAdopcion` INT NOT NULL AUTO_INCREMENT,
  `fk_idUsuario` INT NOT NULL,
  `fk_idAdopcion` INT NOT NULL,
  `nombreProceso` VARCHAR(45) NULL,
  PRIMARY KEY (`idControlAdopcion`),
  CONSTRAINT `fk_Usuario_has_Adopcion_Usuario1`
    FOREIGN KEY (`fk_idUsuario`)
    REFERENCES `adopciones`.`Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_has_Adopcion_Adopcion1`
    FOREIGN KEY (`fk_idAdopcion`)
    REFERENCES `adopciones`.`Adopcion` (`idAdopcion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

ALTER TABLE `Control_Adopcion` AUTO_INCREMENT = 1600;
