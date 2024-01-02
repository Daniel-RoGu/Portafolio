-- -----------------------------------------------------
-- Schema adopciones
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `adopciones`;
CREATE SCHEMA IF NOT EXISTS `adopciones`;
USE `adopciones`;

-- -----------------------------------------------------
-- Table `Roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Roles` ;

CREATE TABLE IF NOT EXISTS `Roles` (
  `idRol` INT NOT NULL AUTO_INCREMENT,
  `nombreRol` VARCHAR(45) NOT NULL,
  `estadoRol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRol`));

ALTER TABLE Roles AUTO_INCREMENT = 100;

-- -----------------------------------------------------
-- Table `Tipo_Documento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tipo_Documento` ;

CREATE TABLE IF NOT EXISTS `Tipo_Documento` (
  `idTipoDocumento` INT NOT NULL AUTO_INCREMENT,
  `tipoDocumento` VARCHAR(45) NOT NULL,
  `estadoDocumento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoDocumento`));

ALTER TABLE Tipo_Documento AUTO_INCREMENT = 200;

-- -----------------------------------------------------
-- Table `Persona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Persona` ;

CREATE TABLE IF NOT EXISTS `Persona` (
  `idPersona` INT NOT NULL,
  `nombrePersona` VARCHAR(45) NOT NULL,
  `apellidoPersona` VARCHAR(45) NOT NULL,
  `edadPersona` INT NULL DEFAULT NULL,
  `fk_idTipoDocumento` INT NOT NULL,
  PRIMARY KEY (`idPersona`),
  CONSTRAINT `fk_Persona_Tipo_Documento1`
    FOREIGN KEY (`fk_idTipoDocumento`)
    REFERENCES `Tipo_Documento` (`idTipoDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Usuario` ;

CREATE TABLE IF NOT EXISTS `Usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nombreUsuario` VARCHAR(45) NOT NULL,
  `contrasenaUsuario` VARCHAR(45) NOT NULL,
  `estadoUsuario` VARCHAR(45) NOT NULL,
  `fk_idRol` INT NOT NULL,
  `fk_idPersona` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  CONSTRAINT `fk_Usuario_Roles1`
    FOREIGN KEY (`fk_idRol`)
    REFERENCES `Roles` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Persona1`
    FOREIGN KEY (`fk_idPersona`)
    REFERENCES `Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Usuario AUTO_INCREMENT = 1000;

-- -----------------------------------------------------
-- Table `Raza`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Raza` ;

CREATE TABLE IF NOT EXISTS `Raza` (
  `idRaza` INT NOT NULL AUTO_INCREMENT,
  `nombreRaza` VARCHAR(45) NOT NULL,
  `estadoRaza` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRaza`));

ALTER TABLE Raza AUTO_INCREMENT = 300;

-- -----------------------------------------------------
-- Table `Tipo_Mascota`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Tipo_Mascota` ;

CREATE TABLE IF NOT EXISTS `Tipo_Mascota` (
  `idTipoMascota` INT NOT NULL AUTO_INCREMENT,
  `tipoMascota` VARCHAR(45) NOT NULL,
  `estadoTipoMascota` VARCHAR(18) NOT NULL,
  PRIMARY KEY (`idTipoMascota`));

ALTER TABLE Tipo_Mascota AUTO_INCREMENT = 400;

-- -----------------------------------------------------
-- Table `Mascota`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mascota` ;

CREATE TABLE IF NOT EXISTS `Mascota` (
  `idMascota` INT NOT NULL AUTO_INCREMENT,
  `nombreMascota` VARCHAR(45) NULL DEFAULT NULL,
  `edadMascota` INT NULL DEFAULT NULL,
  `pesoMascota` INT NULL DEFAULT NULL,
  `generoMascota` VARCHAR(10) NOT NULL,
  `observaciones` VARCHAR(200) NULL DEFAULT NULL,
  `estadoMascota` VARCHAR(45) NOT NULL,
  `fk_idRaza` INT NULL DEFAULT NULL,
  `fk_idTipo_Mascota` INT NOT NULL,
  `fk_idUsuario` INT NOT NULL,
  `imagen` VARCHAR(80) NULL DEFAULT NULL,
  PRIMARY KEY (`idMascota`),
  CONSTRAINT `fk_Mascota_Raza1`
    FOREIGN KEY (`fk_idRaza`)
    REFERENCES `Raza` (`idRaza`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mascota_Tipo Mascota1`
    FOREIGN KEY (`fk_idTipo_Mascota`)
    REFERENCES `Tipo_Mascota` (`idTipoMascota`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mascota_Usuario1`
    FOREIGN KEY (`fk_idUsuario`)
    REFERENCES `Usuario` (`idUsuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Mascota AUTO_INCREMENT = 500;

-- -----------------------------------------------------
-- Table `Vacunas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Vacunas` ;

CREATE TABLE IF NOT EXISTS `Vacunas` (
  `idVacunas` INT NOT NULL AUTO_INCREMENT,
  `nombreVacuna` VARCHAR(45) NOT NULL,
  `estadoVacuna` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idVacunas`));

ALTER TABLE Vacunas AUTO_INCREMENT = 600;

-- -----------------------------------------------------
-- Table `Mascota_Vacunas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Mascota_Vacunas` ;

CREATE TABLE IF NOT EXISTS `Mascota_Vacunas` (
  `idMascotaVacuna` INT NOT NULL AUTO_INCREMENT,
  `fk_idMascota` INT NOT NULL,
  `fk_idVacunas` INT NOT NULL,
  `fechaVacuna` DATE NULL DEFAULT NULL,
  `Vacuna` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idMascotaVacuna`),
  CONSTRAINT `fk_Mascota_has_Vacunas_Mascota1`
    FOREIGN KEY (`fk_idMascota`)
    REFERENCES `Mascota` (`idMascota`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Mascota_has_Vacunas_Vacunas1`
    FOREIGN KEY (`fk_idVacunas`)
    REFERENCES `Vacunas` (`idVacunas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Mascota_Vacunas AUTO_INCREMENT = 700;

-- -----------------------------------------------------
-- Table `Permisos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Permisos` ;

CREATE TABLE IF NOT EXISTS `Permisos` (
  `idPermisos` INT NOT NULL AUTO_INCREMENT,
  `nombrePermiso` VARCHAR(45) NOT NULL,
  `estadoPermiso` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPermisos`));

ALTER TABLE Permisos AUTO_INCREMENT = 800;

-- -----------------------------------------------------
-- Table `Adopcion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Adopcion` ;

CREATE TABLE IF NOT EXISTS `Adopcion` (
  `idAdopcion` INT NOT NULL AUTO_INCREMENT,
  `fechaInicioAdopcion` DATE NOT NULL,
  `fechaFinAdopcion` DATE NULL DEFAULT NULL,
  `nombreAdopta` VARCHAR(45) NOT NULL,
  `apellidoAdopta` VARCHAR(45) NOT NULL,
  `celularAdopta` VARCHAR(10) NOT NULL,
  `documentoAdopta` VARCHAR(10) NOT NULL,
  `TpDocumentoAdopta` VARCHAR(45) NOT NULL,
  `estadoAdopcion` VARCHAR(45) NOT NULL,
  `fk_idMascota` INT NOT NULL,
  PRIMARY KEY (`idAdopcion`),
  CONSTRAINT `fk_Adopcion_Mascota1`
    FOREIGN KEY (`fk_idMascota`)
    REFERENCES `Mascota` (`idMascota`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Adopcion AUTO_INCREMENT = 900;

-- -----------------------------------------------------
-- Table `Permisos_Roles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Permisos_Roles` ;

CREATE TABLE IF NOT EXISTS `Permisos_Roles` (
  `idPermisosRoles` INT NOT NULL AUTO_INCREMENT,
  `fk_idPermisos` INT NOT NULL,
  `fk_idRol` INT NOT NULL,
  `vista_raiz` VARCHAR(45) NOT NULL,
  `vista` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPermisosRoles`),
  CONSTRAINT `fk_Permisos_has_Roles_Permisos1`
    FOREIGN KEY (`fk_idPermisos`)
    REFERENCES `Permisos` (`idPermisos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Permisos_has_Roles_Roles1`
    FOREIGN KEY (`fk_idRol`)
    REFERENCES `Roles` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Permisos_Roles AUTO_INCREMENT = 2000;

-- -----------------------------------------------------
-- Table `UbicacionPersona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `UbicacionPersona` ;

CREATE TABLE IF NOT EXISTS `UbicacionPersona` (
  `idUbicacionPersona` INT NOT NULL AUTO_INCREMENT,
  `Ubicacion` VARCHAR(45) NOT NULL,
  `EstadoUbicacion` VARCHAR(45) NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idUbicacionPersona`),
  CONSTRAINT `fk_UbicacionPersona_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE UbicacionPersona AUTO_INCREMENT = 2100;

-- -----------------------------------------------------
-- Table `CorreoPersona`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `CorreoPersona` ;

CREATE TABLE IF NOT EXISTS `CorreoPersona` (
  `idCorreoPersona` INT NOT NULL AUTO_INCREMENT,
  `correoPersona` VARCHAR(45) NOT NULL,
  `estadoCorreo` VARCHAR(45) NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idCorreoPersona`),
  CONSTRAINT `fk_CorreoPersona_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE CorreoPersona AUTO_INCREMENT = 2200;

-- -----------------------------------------------------
-- Table `Celular`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Celular` ;

CREATE TABLE IF NOT EXISTS `Celular` (
  `idCelular` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(10) NOT NULL,
  `estadoNumero` VARCHAR(45) NOT NULL,
  `Persona_idPersona` INT NOT NULL,
  PRIMARY KEY (`idCelular`),
  CONSTRAINT `fk_Celular_Persona1`
    FOREIGN KEY (`Persona_idPersona`)
    REFERENCES `Persona` (`idPersona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Celular AUTO_INCREMENT = 2300;