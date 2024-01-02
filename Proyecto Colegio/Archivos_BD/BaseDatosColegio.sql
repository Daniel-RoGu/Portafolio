/*drop database bd_colegio;
create database bd_colegio;*/
use bd_colegio;
-- -----------------------------------------------------
-- Table `TipoDocumento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TipoDocumento` ;

CREATE TABLE IF NOT EXISTS `TipoDocumento` (
  `idTipoDocumento` INT NOT NULL AUTO_INCREMENT,
  `nombreTipoDocumento` VARCHAR(150) NOT NULL,
  `estadoTipoDocumento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoDocumento`));

ALTER TABLE TipoDocumento AUTO_INCREMENT = 0;

-- -----------------------------------------------------
-- Table `TipoSangre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TipoSangre` ;

CREATE TABLE IF NOT EXISTS `TipoSangre` (
  `idTipoSangre` INT NOT NULL AUTO_INCREMENT,
  `nombreTipoSangre` VARCHAR(45) NOT NULL,
  `estadoTipoSangre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoSangre`));

ALTER TABLE TipoSangre AUTO_INCREMENT = 10;

-- -----------------------------------------------------
-- Table `Discapacidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Discapacidad` ;

CREATE TABLE IF NOT EXISTS `Discapacidad` (
  `idDiscapacidad` INT NOT NULL AUTO_INCREMENT,
  `nombreDiscapacidad` VARCHAR(450) NOT NULL,
  `estadoDiscapacidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDiscapacidad`));

ALTER TABLE Discapacidad AUTO_INCREMENT = 20;

-- -----------------------------------------------------
-- Table `Sisben`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Sisben` ;

CREATE TABLE IF NOT EXISTS `Sisben` (
  `idSisben` INT NOT NULL AUTO_INCREMENT,
  `nombreSisben` VARCHAR(45) NOT NULL,
  `estadoSisben` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSisben`));

ALTER TABLE Sisben AUTO_INCREMENT = 40;

-- -----------------------------------------------------
-- Table `Rol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Rol` ;

CREATE TABLE IF NOT EXISTS `Rol` (
  `idRol` INT NOT NULL AUTO_INCREMENT,
  `nombreRol` VARCHAR(100) NOT NULL,
  `estadoRol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRol`));

ALTER TABLE Rol AUTO_INCREMENT = 100;

-- -----------------------------------------------------
-- Table `Estrato`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Estrato` ;

CREATE TABLE IF NOT EXISTS `Estrato` (
  `idEstrato` INT NOT NULL AUTO_INCREMENT,
  `nombreEstrato` VARCHAR(45) NOT NULL,
  `estadoEstrato` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstrato`));

ALTER TABLE Estrato AUTO_INCREMENT = 110;

-- -----------------------------------------------------
-- Table `EPS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EPS` ;

CREATE TABLE IF NOT EXISTS `EPS` (
  `idEPS` INT NOT NULL AUTO_INCREMENT,
  `nombreEPS` VARCHAR(450) NOT NULL,
  `estadoEPS` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEPS`));
  
ALTER TABLE EPS AUTO_INCREMENT = 115;


-- -----------------------------------------------------
-- Table `Genero`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Genero` ;

CREATE TABLE IF NOT EXISTS `Genero` (
  `idGenero` INT NOT NULL AUTO_INCREMENT,
  `nombreGenero` VARCHAR(45) NOT NULL,
  `estadoGenero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGenero`));

ALTER TABLE Genero AUTO_INCREMENT = 500;

-- -----------------------------------------------------
-- Table `Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Usuario` ;

CREATE TABLE IF NOT EXISTS `Usuario` (
  `identificacion` INT NOT NULL,
  `nombreUsuario` VARCHAR(45) NOT NULL,
  `segundoNombreUsuario` VARCHAR(45) NULL,
  `primerApellidoUsuario` VARCHAR(45) NOT NULL,
  `segundoApellidoUsuario` VARCHAR(45) NULL,
  `edadUsuario` INT NOT NULL,
  `telefonoCelular` VARCHAR(10) NOT NULL,
  `telefonoFijo` VARCHAR(45) NULL,
  `correo` VARCHAR(450) NOT NULL,
  `direccion` VARCHAR(450) NULL,
  `barrioUbicacionUsuario` VARCHAR(450) NULL,
  `fechaNacimiento` VARCHAR(45) NOT NULL,
  `estadoUsuario` VARCHAR(45) NOT NULL,
  `TipoDocumento_idTipoDocumento` INT NOT NULL,
  `TipoSangre_idTipoSangre` INT NOT NULL,
  `Discapacidad_idDiscapacidad` INT NOT NULL,
  `Sisben_idSisben` INT NOT NULL,
  `Rol_idRol` INT NOT NULL,
  `Estrato_idEstrato` INT NOT NULL,
  `EPS_idEPS` INT NOT NULL,
  `Genero_idGenero` INT NOT NULL,
  PRIMARY KEY (`identificacion`),
  CONSTRAINT `fk_Usuario_TipoDocumento1`
    FOREIGN KEY (`TipoDocumento_idTipoDocumento`)
    REFERENCES `TipoDocumento` (`idTipoDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_TipoSangre1`
    FOREIGN KEY (`TipoSangre_idTipoSangre`)
    REFERENCES `TipoSangre` (`idTipoSangre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Discapacidad1`
    FOREIGN KEY (`Discapacidad_idDiscapacidad`)
    REFERENCES `Discapacidad` (`idDiscapacidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Sisben1`
    FOREIGN KEY (`Sisben_idSisben`)
    REFERENCES `Sisben` (`idSisben`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Rol1`
    FOREIGN KEY (`Rol_idRol`)
    REFERENCES `Rol` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Estrato1`
    FOREIGN KEY (`Estrato_idEstrato`)
    REFERENCES `Estrato` (`idEstrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_EPS1`
    FOREIGN KEY (`EPS_idEPS`)
    REFERENCES `EPS` (`idEPS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Genero1`
    FOREIGN KEY (`Genero_idGenero`)
    REFERENCES `Genero` (`idGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


-- -----------------------------------------------------
-- Table `Permiso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Permiso` ;

CREATE TABLE IF NOT EXISTS `Permiso` (
  `idPermiso` INT NOT NULL AUTO_INCREMENT,
  `nombrePermiso` VARCHAR(250) NOT NULL,
  `estadoPermiso` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPermiso`));

ALTER TABLE Permiso AUTO_INCREMENT = 510;

-- -----------------------------------------------------
-- Table `RolPermiso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RolPermiso` ;

CREATE TABLE IF NOT EXISTS `RolPermiso` (
  `idRolPermiso` INT NOT NULL AUTO_INCREMENT,
  `nombreVista` VARCHAR(250) NOT NULL,
  `vistaRaiz` VARCHAR(250) NOT NULL,
  `Rol_idRol` INT NOT NULL,
  `Permiso_idPermiso` INT NOT NULL,
  PRIMARY KEY (`idRolPermiso`),
  CONSTRAINT `fk_RolPermiso_Rol1`
    FOREIGN KEY (`Rol_idRol`)
    REFERENCES `Rol` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RolPermiso_Permiso1`
    FOREIGN KEY (`Permiso_idPermiso`)
    REFERENCES `Permiso` (`idPermiso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE RolPermiso AUTO_INCREMENT = 600;

-- -----------------------------------------------------
-- Table `Estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Estudiante` ;

CREATE TABLE IF NOT EXISTS `Estudiante` (
  `idEstudiante` INT NOT NULL AUTO_INCREMENT,
  `identificacionAcudiente` INT NOT NULL,
  `nombreAcudiente` VARCHAR(45) NOT NULL,
  `apellidoAcudiente` VARCHAR(45) NOT NULL,
  `generoAcudiente` VARCHAR(45) NOT NULL,
  `correoAcudiente` VARCHAR(250) NOT NULL,
  `celularAcudiente` VARCHAR(45) NOT NULL,
  `parentescoAcudiente` VARCHAR(250) NOT NULL,
  `responsabilidadEconomicaAcudiente` VARCHAR(450) NOT NULL,
  `codigoEstudiante` VARCHAR(45) NOT NULL,
  `ciudadNacimiento` VARCHAR(200) NOT NULL,
  `ciudadResidencia` VARCHAR(200) NOT NULL,
  `ciudadExpedicionDocumento` VARCHAR(45) NOT NULL,
  `paisOrigen` VARCHAR(100) NOT NULL,
  `asistenciaAcademicaEspecial` VARCHAR(450) NOT NULL,
  `desplazadoEstado` VARCHAR(45) NOT NULL,
  `Usuario_identificacion` INT NOT NULL,
  PRIMARY KEY (`idEstudiante`),
  CONSTRAINT `fk_Estudiante_Usuario1`
    FOREIGN KEY (`Usuario_identificacion`)
    REFERENCES `Usuario` (`identificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Estudiante AUTO_INCREMENT = 900;

-- -----------------------------------------------------
-- Table `Modalida_Educativa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `ModalidadEducativa` ;

CREATE TABLE IF NOT EXISTS `ModalidadEducativa` (
  `idModalidad_Educativa` INT NOT NULL AUTO_INCREMENT,
  `nombreModalidad` VARCHAR(250) NOT NULL,
  `estadoModalidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idModalidad_Educativa`));

ALTER TABLE ModalidadEducativa AUTO_INCREMENT = 10900;

-- -----------------------------------------------------
-- Table `Sede`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Sede` ;

CREATE TABLE IF NOT EXISTS `Sede` (
  `idSede` INT NOT NULL AUTO_INCREMENT,
  `nombreSede` VARCHAR(250) NOT NULL,
  `internadoDisponibilidad` VARCHAR(45) NOT NULL,
  `estadoSede` VARCHAR(45) NOT NULL,
  `fk_idModalidadEducativa` INT NOT NULL,
  PRIMARY KEY (`idSede`),
  CONSTRAINT `fk_Sede_ModalidaEducativa1`
    FOREIGN KEY (`fk_idModalidadEducativa`)
    REFERENCES `ModalidadEducativa` (`idModalidad_Educativa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Sede AUTO_INCREMENT = 10920;

-- -----------------------------------------------------
-- Table `Docente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Docente` ;

CREATE TABLE IF NOT EXISTS `Docente` (
  `idDocente` INT NOT NULL AUTO_INCREMENT,
  `estadoDocente` VARCHAR(45) NOT NULL,
  `horasLaboralesSemanales` INT NOT NULL,
  `Usuario_identificacion` INT NOT NULL,
  `Sede_idSede` INT NOT NULL,
  PRIMARY KEY (`idDocente`),
  CONSTRAINT `fk_Docente_Usuario1`
    FOREIGN KEY (`Usuario_identificacion`)
    REFERENCES `Usuario` (`identificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Docente_Sede1`
    FOREIGN KEY (`Sede_idSede`)
    REFERENCES `Sede` (`idSede`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Sede AUTO_INCREMENT = 10930;

-- -----------------------------------------------------
-- Table `Funcionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Funcionario` ;

CREATE TABLE IF NOT EXISTS `Funcionario` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT,
  `firmaFuncionario` LONGBLOB NOT NULL,
  `estadoFuncionario` VARCHAR(45) NOT NULL,
  `Usuario_identificacion` INT NOT NULL,
  `Sede_idSede` INT NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  CONSTRAINT `fk_Funcionario_Usuario1`
    FOREIGN KEY (`Usuario_identificacion`)
    REFERENCES `Usuario` (`identificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionario_Sede1`
    FOREIGN KEY (`Sede_idSede`)
    REFERENCES `Sede` (`idSede`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Funcionario AUTO_INCREMENT = 11230;

-- -----------------------------------------------------
-- Table `Horario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Horario` ;

CREATE TABLE IF NOT EXISTS `Horario` (
  `idHorario` INT NOT NULL AUTO_INCREMENT,
  `horaInicio` VARCHAR(45) NOT NULL,
  `horaFin` VARCHAR(45) NOT NULL,
  `fechaHorario` VARCHAR(45) NOT NULL,
  `estadoHorario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idHorario`));

ALTER TABLE Horario AUTO_INCREMENT = 11330;

-- -----------------------------------------------------
-- Table `Asignatura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Asignatura` ;

CREATE TABLE IF NOT EXISTS `Asignatura` (
  `idAsignatura` INT NOT NULL AUTO_INCREMENT,
  `nombreAsignatura` VARCHAR(45) NOT NULL,
  `estadoAsignatura` VARCHAR(45) NOT NULL,
  `horasSemanales` INT NOT NULL,
  `Horario_idHorario` INT NOT NULL,
  PRIMARY KEY (`idAsignatura`),
  CONSTRAINT `fk_Asignatura_Horario1`
    FOREIGN KEY (`Horario_idHorario`)
    REFERENCES `Horario` (`idHorario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Asignatura AUTO_INCREMENT = 21330;

-- -----------------------------------------------------
-- Table `GradoAsignatura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GradoAsignatura` ;

CREATE TABLE IF NOT EXISTS `GradoAsignatura` (
  `idGradoAsignatura` INT NOT NULL AUTO_INCREMENT,
  `docenteAsignado` VARCHAR(45) NOT NULL,
  `estadoAsignaturaGrado` VARCHAR(45) NOT NULL,
  `Asignatura_idAsignatura` INT NOT NULL,
  PRIMARY KEY (`idGradoAsignatura`),
  CONSTRAINT `fk_GradoAsignatura_Asignatura1`
    FOREIGN KEY (`Asignatura_idAsignatura`)
    REFERENCES `Asignatura` (`idAsignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Asignatura AUTO_INCREMENT = 21350;

-- -----------------------------------------------------
-- Table `Grados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Grados` ;

CREATE TABLE IF NOT EXISTS `Grados` (
  `idGrado` INT NOT NULL AUTO_INCREMENT,
  `nombreGrado` VARCHAR(45) NOT NULL,
  `nombreTitular` VARCHAR(100) NOT NULL,
  `estadoGrado` VARCHAR(45) NOT NULL,
  `GradoAsignatura_idGradoAsignatura` INT NOT NULL,
  PRIMARY KEY (`idGrado`),
  CONSTRAINT `fk_Grados_GradoAsignatura1`
    FOREIGN KEY (`GradoAsignatura_idGradoAsignatura`)
    REFERENCES `GradoAsignatura` (`idGradoAsignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Grados AUTO_INCREMENT = 21370;

-- -----------------------------------------------------
-- Table `SedeGrados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SedeGrados` ;

CREATE TABLE IF NOT EXISTS `SedeGrados` (
  `idSedeGrados` INT NOT NULL AUTO_INCREMENT,
  `estadoGradoSede` VARCHAR(45) NOT NULL,
  `Sede_idSede` INT NOT NULL,
  `Grados_idGrado` INT NOT NULL,
  PRIMARY KEY (`idSedeGrados`),
  CONSTRAINT `fk_SedeGrupos_Sede1`
    FOREIGN KEY (`Sede_idSede`)
    REFERENCES `Sede` (`idSede`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SedeGrados_Grados1`
    FOREIGN KEY (`Grados_idGrado`)
    REFERENCES `Grados` (`idGrado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Grados AUTO_INCREMENT = 21390;

-- -----------------------------------------------------
-- Table `Grupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Grupo` ;

CREATE TABLE IF NOT EXISTS `Grupo` (
  `idGrupo` INT NOT NULL AUTO_INCREMENT,
  `nombreGrupo` VARCHAR(45) NOT NULL,
  `estadoGrupo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGrupo`));

ALTER TABLE Grupo AUTO_INCREMENT = 21440;

-- -----------------------------------------------------
-- Table `GradoGrupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GradoGrupo` ;

CREATE TABLE IF NOT EXISTS `GradoGrupo` (
  `idGradoGrupo` INT NOT NULL AUTO_INCREMENT,
  `estadoGrupoGrado` VARCHAR(45) NOT NULL,
  `Grados_idGrado` INT NOT NULL,
  `Grupo_idGrupo` INT NOT NULL,
  PRIMARY KEY (`idGradoGrupo`),
  CONSTRAINT `fk_GradoGrupo_Grados1`
    FOREIGN KEY (`Grados_idGrado`)
    REFERENCES `Grados` (`idGrado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_GradoGrupo_Grupo1`
    FOREIGN KEY (`Grupo_idGrupo`)
    REFERENCES `Grupo` (`idGrupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE GradoGrupo AUTO_INCREMENT = 21500;

-- -----------------------------------------------------
-- Table `PeriodoAcademico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PeriodoAcademico` ;

CREATE TABLE IF NOT EXISTS `PeriodoAcademico` (
  `idPeriodoAcademico` INT NOT NULL AUTO_INCREMENT,
  `periodoAcademico` VARCHAR(45) NOT NULL,
  `fechaInicio` VARCHAR(45) NOT NULL,
  `fechaFin` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPeriodoAcademico`));

ALTER TABLE PeriodoAcademico AUTO_INCREMENT = 21540;

-- -----------------------------------------------------
-- Table `NotasGenerales`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `NotasGenerales`;

CREATE TABLE IF NOT EXISTS `NotasGenerales` (
  `idNotas` INT NOT NULL AUTO_INCREMENT,
  `Nota` DOUBLE NOT NULL,
  `estadoNota` VARCHAR(45) NOT NULL,
  `Asignatura_idAsignatura` INT NOT NULL,
  `PeriodoAcademico_idPeriodoAcademico` INT NOT NULL,
  PRIMARY KEY (`idNotas`),
  CONSTRAINT `fk_Notas_Asignatura1`
    FOREIGN KEY (`Asignatura_idAsignatura`)
    REFERENCES `Asignatura` (`idAsignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NotasGenerales_PeriodoAcademico1`
    FOREIGN KEY (`PeriodoAcademico_idPeriodoAcademico`)
    REFERENCES `PeriodoAcademico` (`idPeriodoAcademico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE NotasGenerales AUTO_INCREMENT = 21545;

-- -----------------------------------------------------
-- Table `Competencias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Competencias` ;

CREATE TABLE IF NOT EXISTS `Competencias` (
  `idCompetencias` INT NOT NULL AUTO_INCREMENT,
  `nombreCompetencia` VARCHAR(45) NOT NULL,
  `objetivoCompetencia` VARCHAR(45) NOT NULL,
  `notaCompetencia` DOUBLE NOT NULL,
  `estadoCompetencia` VARCHAR(45) NOT NULL,
  `Asignatura_idAsignatura` INT NOT NULL,
  PRIMARY KEY (`idCompetencias`),
  CONSTRAINT `fk_Competencias_Asignatura1`
    FOREIGN KEY (`Asignatura_idAsignatura`)
    REFERENCES `Asignatura` (`idAsignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Competencias AUTO_INCREMENT = 21550;

-- -----------------------------------------------------
-- Table `Matricula`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Matricula` ;

CREATE TABLE IF NOT EXISTS `Matricula` (
  `idMatricula` INT NOT NULL AUTO_INCREMENT,
  `jornada` VARCHAR(45) NOT NULL,
  `fechaInicio` VARCHAR(45) NOT NULL,
  `fechaFin` VARCHAR(45) NULL,
  `gradoEstudiante` VARCHAR(45) NULL,
  `grupoEstudiante` VARCHAR(45) NULL,
  `internadoEstado` VARCHAR(45) NOT NULL,
  `estadoMatricula` VARCHAR(45) NOT NULL,
  `estudiante_idEstudiante` INT NOT NULL,
  `funcionario_idFuncionario` INT NOT NULL,
  `sede_idSede` INT NOT NULL,
  PRIMARY KEY (`idMatricula`),
  CONSTRAINT `fk_Matricula_Estudiante1`
    FOREIGN KEY (`estudiante_idEstudiante`)
    REFERENCES `Estudiante` (`idEstudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_Funcionario1`
    FOREIGN KEY (`funcionario_idFuncionario`)
    REFERENCES `Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_Sede1`
    FOREIGN KEY (`sede_idSede`)
    REFERENCES `Sede` (`idSede`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Competencias AUTO_INCREMENT = 24550;

-- -----------------------------------------------------
-- Table `Observaciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Observaciones` ;

CREATE TABLE IF NOT EXISTS `Observaciones` (
  `idObservacion` INT NOT NULL AUTO_INCREMENT,
  `nombreSede` VARCHAR(45) NOT NULL,
  `estadoSede` VARCHAR(45) NOT NULL,
  `fk_idEstudiante` INT NOT NULL,
  `fk_idModalida_Educativa` INT NOT NULL,
  PRIMARY KEY (`idObservacion`),
  CONSTRAINT `fk_Sede_Estudiante1`
    FOREIGN KEY (`fk_idEstudiante`)
    REFERENCES `Estudiante` (`idEstudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Observaciones AUTO_INCREMENT = 28550;