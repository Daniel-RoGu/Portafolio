/*
Drop database bdColegio;
Create database bdColegio CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
*/
Use bdColegio;

-- -----------------------------------------------------
-- Table `TipoDocumento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TipoDocumento` ;

CREATE TABLE IF NOT EXISTS `TipoDocumento` (
  `idTipoDocumento` INT NOT NULL AUTO_INCREMENT,
  `nombreTipoDocumento` VARCHAR(400) NOT NULL,
  `estadoTipoDocumento` VARCHAR(400) NOT NULL,
  PRIMARY KEY (`idTipoDocumento`));

ALTER TABLE TipoDocumento AUTO_INCREMENT = 0;

-- -----------------------------------------------------
-- Table `TipoSangre`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TipoSangre` ;

CREATE TABLE IF NOT EXISTS `TipoSangre` (
  `idTipoSangre` INT NOT NULL AUTO_INCREMENT,
  `nombreTipoSangre` VARCHAR(400) NOT NULL,
  `estadoTipoSangre` VARCHAR(400) NOT NULL,
  PRIMARY KEY (`idTipoSangre`));

ALTER TABLE TipoSangre AUTO_INCREMENT = 200;

-- -----------------------------------------------------
-- Table `Discapacidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Discapacidad` ;

CREATE TABLE IF NOT EXISTS `Discapacidad` (
  `idDiscapacidad` INT NOT NULL AUTO_INCREMENT,
  `nombreDiscapacidad` VARCHAR(400) NOT NULL,
  `estadoDiscapacidad` VARCHAR(400) NOT NULL,
  PRIMARY KEY (`idDiscapacidad`));

ALTER TABLE Discapacidad AUTO_INCREMENT = 300;

-- -----------------------------------------------------
-- Table `Sisben`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Sisben` ;

CREATE TABLE IF NOT EXISTS `Sisben` (
  `idSisben` INT NOT NULL AUTO_INCREMENT,
  `nombreSisben` VARCHAR(400) NOT NULL,
  `estadoSisben` VARCHAR(400) NOT NULL,
  PRIMARY KEY (`idSisben`));

ALTER TABLE Sisben AUTO_INCREMENT = 600;

-- -----------------------------------------------------
-- Table `Rol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Rol` ;

CREATE TABLE IF NOT EXISTS `Rol` (
  `idRol` INT NOT NULL AUTO_INCREMENT,
  `nombreRol` VARCHAR(400) NOT NULL,
  `estadoRol` VARCHAR(400) NOT NULL,
  PRIMARY KEY (`idRol`));

ALTER TABLE Rol AUTO_INCREMENT = 800;

-- -----------------------------------------------------
-- Table `Estrato`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Estrato` ;

CREATE TABLE IF NOT EXISTS `Estrato` (
  `idEstrato` INT NOT NULL AUTO_INCREMENT,
  `nombreEstrato` VARCHAR(400) NOT NULL,
  `estadoEstrato` VARCHAR(400) NOT NULL,
  PRIMARY KEY (`idEstrato`));

ALTER TABLE Estrato AUTO_INCREMENT = 900;

-- -----------------------------------------------------
-- Table `EPS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EPS` ;

CREATE TABLE IF NOT EXISTS `EPS` (
  `idEPS` INT NOT NULL AUTO_INCREMENT,
  `nombreEPS` VARCHAR(400) NOT NULL,
  `estadoEPS` VARCHAR(400) NOT NULL,
  PRIMARY KEY (`idEPS`));

ALTER TABLE EPS AUTO_INCREMENT = 1100;

-- -----------------------------------------------------
-- Table `Genero`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Genero` ;

CREATE TABLE IF NOT EXISTS `Genero` (
  `idGenero` INT NOT NULL AUTO_INCREMENT,
  `nombreGenero` VARCHAR(400) NOT NULL,
  `estadoGenero` VARCHAR(400) NOT NULL,
  PRIMARY KEY (`idGenero`));

ALTER TABLE Genero AUTO_INCREMENT = 2000;

-- -----------------------------------------------------
-- Table `Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Usuario` ;

CREATE TABLE IF NOT EXISTS `Usuario` (
  `identificacion` BIGINT NOT NULL,
  `primerNombreUsuario` VARCHAR(400) NULL,
  `segundoNombreUsuario` VARCHAR(400) NULL,
  `primerApellidoUsuario` VARCHAR(400) NULL,
  `segundoApellidoUsuario` VARCHAR(400) NULL,
  `edadUsuario` INT NOT NULL,
  `telefonoCelular` VARCHAR(40) NULL,
  `telefonoFijo` VARCHAR(45) NULL,
  `correo` VARCHAR(400) NULL,
  `direccion` VARCHAR(400) NULL,
  `barrioUbicacionUsuario` VARCHAR(400) NULL,
  `fechaNacimiento` VARCHAR(400) NULL,
  `estadoUsuario` VARCHAR(400) NULL,
  `fkidTipoDocumento` INT NULL,
  `fkidTipoSangre` INT NULL,
  `fkidDiscapacidad` INT NULL,
  `fkidSisben` INT NULL,
  `fkidRol` INT NULL,
  `fkidEstrato` INT NULL,
  `fkidEPS` INT NULL,
  `fkidGenero` INT NULL,
  PRIMARY KEY (`identificacion`),
  CONSTRAINT `fk_Usuario_TipoDocumento1`
    FOREIGN KEY (`fkidTipoDocumento`)
    REFERENCES `TipoDocumento` (`idTipoDocumento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_TipoSangre1`
    FOREIGN KEY (`fkidTipoSangre`)
    REFERENCES `TipoSangre` (`idTipoSangre`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Discapacidad1`
    FOREIGN KEY (`fkidDiscapacidad`)
    REFERENCES `Discapacidad` (`idDiscapacidad`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Sisben1`
    FOREIGN KEY (`fkidSisben`)
    REFERENCES `Sisben` (`idSisben`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Rol1`
    FOREIGN KEY (`fkidRol`)
    REFERENCES `Rol` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Estrato1`
    FOREIGN KEY (`fkidEstrato`)
    REFERENCES `Estrato` (`idEstrato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_EPS1`
    FOREIGN KEY (`fkidEPS`)
    REFERENCES `EPS` (`idEPS`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Usuario_Genero1`
    FOREIGN KEY (`fkidGenero`)
    REFERENCES `Genero` (`idGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Usuario AUTO_INCREMENT = 2100;

-- -----------------------------------------------------
-- Table `Permiso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Permiso` ;

CREATE TABLE IF NOT EXISTS `Permiso` (
  `idPermiso` INT NOT NULL AUTO_INCREMENT,
  `nombrePermiso` VARCHAR(400) NOT NULL,
  `estadoPermiso` VARCHAR(400) NOT NULL,
  PRIMARY KEY (`idPermiso`));

ALTER TABLE Permiso AUTO_INCREMENT = 20000;

-- -----------------------------------------------------
-- Table `RolPermiso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RolPermiso` ;

CREATE TABLE IF NOT EXISTS `RolPermiso` (
  `idRolPermiso` INT NOT NULL AUTO_INCREMENT,
  `nombreVista` VARCHAR(400) NOT NULL,
  `vistaRaiz` VARCHAR(400) NOT NULL,
  `fkidRol` INT NOT NULL,
  `fkidPermiso` INT NOT NULL,
  PRIMARY KEY (`idRolPermiso`),
  CONSTRAINT `fk_RolPermiso_Rol1`
    FOREIGN KEY (`fkidRol`)
    REFERENCES `Rol` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RolPermiso_Permiso1`
    FOREIGN KEY (`fkidPermiso`)
    REFERENCES `Permiso` (`idPermiso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE RolPermiso AUTO_INCREMENT = 20100;

-- -----------------------------------------------------
-- Table `Estudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Estudiante` ;

CREATE TABLE IF NOT EXISTS `Estudiante` (
  `idEstudiante` INT NOT NULL AUTO_INCREMENT,
  `codigoEstudiante` VARCHAR(400) NULL,
  `ciudadNacimiento` VARCHAR(400) NULL,
  `ciudadResidencia` VARCHAR(400) NULL,
  `ciudadExpedicionDocumento` VARCHAR(400) NULL,
  `paisOrigen` VARCHAR(400) NULL,
  `asistenciaAcademicaEspecial` VARCHAR(400) NULL,
  `desplazadoEstado` VARCHAR(400) NULL,
  `Usuario_identificacion` BIGINT NOT NULL,
  PRIMARY KEY (`idEstudiante`),
  CONSTRAINT `fk_Estudiante_Usuario1`
    FOREIGN KEY (`Usuario_identificacion`)
    REFERENCES `Usuario` (`identificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Estudiante AUTO_INCREMENT = 21000;

-- -----------------------------------------------------
-- Table `Modalida_Educativa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Modalida_Educativa` ;

CREATE TABLE IF NOT EXISTS `Modalida_Educativa` (
  `idModalida_Educativa` INT NOT NULL AUTO_INCREMENT,
  `nombreModalidad` VARCHAR(400) NOT NULL,
  `estadoModalidad` VARCHAR(400) NOT NULL,
  PRIMARY KEY (`idModalida_Educativa`));

ALTER TABLE Modalida_Educativa AUTO_INCREMENT = 31000;

-- -----------------------------------------------------
-- Table `Sede`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Sede` ;

CREATE TABLE IF NOT EXISTS `Sede` (
  `idSede` INT NOT NULL AUTO_INCREMENT,
  `nombreSede` VARCHAR(400) NOT NULL,
  `internadoDisponibilidad` VARCHAR(400) NOT NULL,
  `estadoSede` VARCHAR(400) NOT NULL,
  `fk_idModalida_Educativa` INT NOT NULL,
  PRIMARY KEY (`idSede`),
  CONSTRAINT `fk_Sede_Modalida_Educativa1`
    FOREIGN KEY (`fk_idModalida_Educativa`)
    REFERENCES `Modalida_Educativa` (`idModalida_Educativa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Sede AUTO_INCREMENT = 31100;

-- -----------------------------------------------------
-- Table `Docente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Docente` ;

CREATE TABLE IF NOT EXISTS `Docente` (
  `idDocente` INT NOT NULL AUTO_INCREMENT,
  `estadoDocente` VARCHAR(400) NOT NULL,
  `horasLaboralesSemanales` INT NOT NULL,
  `fkidentificacion` BIGINT NOT NULL,
  `fkidSede` INT NOT NULL,
  PRIMARY KEY (`idDocente`),
  CONSTRAINT `fk_Docente_Usuario1`
    FOREIGN KEY (`fkidentificacion`)
    REFERENCES `Usuario` (`identificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Docente_Sede1`
    FOREIGN KEY (`fkidSede`)
    REFERENCES `Sede` (`idSede`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Docente AUTO_INCREMENT = 31200;

-- -----------------------------------------------------
-- Table `Funcionario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Funcionario` ;

CREATE TABLE IF NOT EXISTS `Funcionario` (
  `idFuncionario` INT NOT NULL AUTO_INCREMENT,
  `firmaFuncionario` LONGBLOB NOT NULL,
  `estadoFuncionario` VARCHAR(400) NOT NULL,
  `Usuario_identificacion` BIGINT NOT NULL,
  `fkidSede` INT NOT NULL,
  PRIMARY KEY (`idFuncionario`),
  CONSTRAINT `fk_Funcionario_Usuario1`
    FOREIGN KEY (`Usuario_identificacion`)
    REFERENCES `Usuario` (`identificacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionario_Sede1`
    FOREIGN KEY (`fkidSede`)
    REFERENCES `Sede` (`idSede`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Funcionario AUTO_INCREMENT = 32200;

-- -----------------------------------------------------
-- Table `Grados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Grados` ;

CREATE TABLE IF NOT EXISTS `Grados` (
  `idGrado` INT NOT NULL AUTO_INCREMENT,
  `nombreGrado` VARCHAR(400) NOT NULL,
  `estadoGrado` VARCHAR(400) NOT NULL,
  PRIMARY KEY (`idGrado`));

ALTER TABLE Grados AUTO_INCREMENT = 33200;

-- -----------------------------------------------------
-- Table `SedeGrados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SedeGrados` ;

CREATE TABLE IF NOT EXISTS `SedeGrados` (
  `idSedeGrados` INT NOT NULL AUTO_INCREMENT,
  `estadoGradoSede` VARCHAR(400) NOT NULL,
  `fkidSede` INT NOT NULL,
  `fkidGrado` INT NOT NULL,
  PRIMARY KEY (`idSedeGrados`),
  CONSTRAINT `fk_SedeGrupos_Sede1`
    FOREIGN KEY (`fkidSede`)
    REFERENCES `Sede` (`idSede`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_SedeGrados_Grados1`
    FOREIGN KEY (`fkidGrado`)
    REFERENCES `Grados` (`idGrado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE SedeGrados AUTO_INCREMENT = 33500;

-- -----------------------------------------------------
-- Table `Grupos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Grupos` ;

CREATE TABLE IF NOT EXISTS `Grupos` (
  `idGrupo` INT NOT NULL AUTO_INCREMENT,
  `nombreGrupo` VARCHAR(400) NOT NULL,
  `estadoGrupo` VARCHAR(400) NOT NULL,
  PRIMARY KEY (`idGrupo`));

ALTER TABLE Grupos AUTO_INCREMENT = 34500;

-- -----------------------------------------------------
-- Table `GradoGrupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GradoGrupo` ;

CREATE TABLE IF NOT EXISTS `GradoGrupo` (
  `idGradoGrupo` INT NOT NULL AUTO_INCREMENT,
  `nombreTitular` VARCHAR(400) NOT NULL,
  `estadoGrupoGrado` VARCHAR(400) NOT NULL,
  `fkidGrado` INT NOT NULL,
  `fkidGrupo` INT NOT NULL,
  PRIMARY KEY (`idGradoGrupo`),
  CONSTRAINT `fk_GradoGrupo_Grados1`
    FOREIGN KEY (`fkidGrado`)
    REFERENCES `Grados` (`idGrado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_GradoGrupo_Grupo1`
    FOREIGN KEY (`fkidGrupo`)
    REFERENCES `Grupos` (`idGrupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE GradoGrupo AUTO_INCREMENT = 35000;

-- -----------------------------------------------------
-- Table `Horario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Horario` ;

CREATE TABLE IF NOT EXISTS `Horario` (
  `idHorario` INT NOT NULL AUTO_INCREMENT,
  `horaInicio` VARCHAR(400) NOT NULL,
  `horaFin` VARCHAR(400) NOT NULL,
  `fechaHorario` VARCHAR(400) NOT NULL,
  `estadoHorario` VARCHAR(400) NOT NULL,
  PRIMARY KEY (`idHorario`));

ALTER TABLE Horario AUTO_INCREMENT = 36000;

-- -----------------------------------------------------
-- Table `Asignatura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Asignatura` ;

CREATE TABLE IF NOT EXISTS `Asignatura` (
  `idAsignatura` INT NOT NULL AUTO_INCREMENT,
  `nombreAsignatura` VARCHAR(400) NOT NULL,
  `estadoAsignatura` VARCHAR(400) NOT NULL,
  `horasSemanales` INT NOT NULL,
  `fkidHorario` INT NOT NULL,
  PRIMARY KEY (`idAsignatura`),
  CONSTRAINT `fk_Asignatura_Horario1`
    FOREIGN KEY (`fkidHorario`)
    REFERENCES `Horario` (`idHorario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Asignatura AUTO_INCREMENT = 37000;

-- -----------------------------------------------------
-- Table `AsignaturasGrado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AsignaturasGrado` ;

CREATE TABLE IF NOT EXISTS `AsignaturasGrado` (
  `idGradoAsignatura` INT NOT NULL AUTO_INCREMENT,
  `estadoAsignaturaGrado` VARCHAR(400) NOT NULL,
  `fkidAsignatura` INT NOT NULL,
  `fkidGrado` INT NOT NULL,
  PRIMARY KEY (`idGradoAsignatura`),
  CONSTRAINT `fk_GradoAsignatura_Asignatura1`
    FOREIGN KEY (`fkidAsignatura`)
    REFERENCES `Asignatura` (`idAsignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_GradoAsignatura_Grados1`
    FOREIGN KEY (`fkidGrado`)
    REFERENCES `Grados` (`idGrado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE AsignaturasGrado AUTO_INCREMENT = 38000;

-- -----------------------------------------------------
-- Table `PeriodoAcademico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `PeriodoAcademico` ;

CREATE TABLE IF NOT EXISTS `PeriodoAcademico` (
  `idPeriodoAcademico` INT NOT NULL AUTO_INCREMENT,
  `periodoAcademico` VARCHAR(400) NOT NULL,
  `fechaInicio` VARCHAR(400) NOT NULL,
  `fechaFin` VARCHAR(400) NOT NULL,
  `estadoPeriodo` VARCHAR(400) NOT NULL,
  PRIMARY KEY (`idPeriodoAcademico`));

ALTER TABLE PeriodoAcademico AUTO_INCREMENT = 39000;

-- -----------------------------------------------------
-- Table `NotaFinal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `NotaFinal` ;

CREATE TABLE IF NOT EXISTS `NotaFinal` (
  `idNotaDefinitiva` INT NOT NULL AUTO_INCREMENT,
  `añoElectivo` VARCHAR(400) NOT NULL,
  `calificacionAño` FLOAT NOT NULL,
  `estadoCalificacionAño` VARCHAR(400) NOT NULL,
  PRIMARY KEY (`idNotaDefinitiva`));

ALTER TABLE NotaFinal AUTO_INCREMENT = 39100;

-- -----------------------------------------------------
-- Table `NotaDefinitivaPeriodo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `NotaDefinitivaPeriodo` ;

CREATE TABLE IF NOT EXISTS `NotaDefinitivaPeriodo` (
  `idNotas` INT NOT NULL AUTO_INCREMENT,
  `notaGeneral` DOUBLE NOT NULL,
  `estadoNota` VARCHAR(400) NOT NULL,
  `fkidPeriodoAcademico` INT NOT NULL,
  `fkidAsignatura` INT NOT NULL,
  `fkidNotaDefinitiva` INT NOT NULL,
  PRIMARY KEY (`idNotas`),
  CONSTRAINT `fk_NotaDefinitiva_PeriodoAcademico1`
    FOREIGN KEY (`fkidPeriodoAcademico`)
    REFERENCES `PeriodoAcademico` (`idPeriodoAcademico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NotaDefinitiva_Asignatura1`
    FOREIGN KEY (`fkidAsignatura`)
    REFERENCES `Asignatura` (`idAsignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NotaDefinitivaPeriodo_NotaFinal1`
    FOREIGN KEY (`fkidNotaDefinitiva`)
    REFERENCES `NotaFinal` (`idNotaDefinitiva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE NotaDefinitivaPeriodo AUTO_INCREMENT = 50100;

-- -----------------------------------------------------
-- Table `Competencias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Competencias` ;

CREATE TABLE IF NOT EXISTS `Competencias` (
  `idCompetencias` INT NOT NULL AUTO_INCREMENT,
  `nombreCompetencia` VARCHAR(400) NOT NULL,
  `objetivoCompetencia` VARCHAR(400) NOT NULL,
  `informacionCompetencia` VARCHAR(400) NULL,
  `estadoCompetencia` VARCHAR(400) NOT NULL,
  `fkidAsignatura` INT NOT NULL,
  PRIMARY KEY (`idCompetencias`),
  CONSTRAINT `fk_Competencias_Asignatura1`
    FOREIGN KEY (`fkidAsignatura`)
    REFERENCES `Asignatura` (`idAsignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Competencias AUTO_INCREMENT = 60100;

-- -----------------------------------------------------
-- Table `Matricula`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Matricula` ;

CREATE TABLE IF NOT EXISTS `Matricula` (
  `idMatricula` INT NOT NULL AUTO_INCREMENT,
  `jornada` VARCHAR(400) NOT NULL,
  `fechaInicio` VARCHAR(400) NOT NULL,
  `fechaFin` VARCHAR(400) NULL,
  `internadoEstado` VARCHAR(400) NOT NULL,
  `gradoEstudiante` VARCHAR(400) NOT NULL,
  `grupoEstudiante` VARCHAR(400) NOT NULL,
  `estadoMatricula` VARCHAR(400) NOT NULL,
  `fkidEstudiante` INT NOT NULL,
  `fkidFuncionario` INT NOT NULL,
  `fkidSede` INT NOT NULL,
  PRIMARY KEY (`idMatricula`),
  CONSTRAINT `fk_Matricula_Estudiante1`
    FOREIGN KEY (`fkidEstudiante`)
    REFERENCES `Estudiante` (`idEstudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_Funcionario1`
    FOREIGN KEY (`fkidFuncionario`)
    REFERENCES `Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Matricula_Sede1`
    FOREIGN KEY (`fkidSede`)
    REFERENCES `Sede` (`idSede`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Matricula AUTO_INCREMENT = 70100;

-- -----------------------------------------------------
-- Table `Observaciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Observaciones` ;

CREATE TABLE IF NOT EXISTS `Observaciones` (
  `idObservacion` INT NOT NULL AUTO_INCREMENT,
  `descripcionObservacion` VARCHAR(450) NOT NULL,
  `estadoObservacion` VARCHAR(400) NOT NULL,
  `fkidEstudiante` INT NOT NULL,
  `fkidFuncionario` INT NOT NULL,
  PRIMARY KEY (`idObservacion`),
  CONSTRAINT `fk_Observaciones_Estudiante1`
    FOREIGN KEY (`fkidEstudiante`)
    REFERENCES `Estudiante` (`idEstudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Observaciones_Funcionario1`
    FOREIGN KEY (`fkidFuncionario`)
    REFERENCES `Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Observaciones AUTO_INCREMENT = 100100;

-- -----------------------------------------------------
-- Table `Asistencia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Asistencia` ;

CREATE TABLE IF NOT EXISTS `Asistencia` (
  `idAsistencia` INT NOT NULL AUTO_INCREMENT,
  `nFallas` VARCHAR(400) NOT NULL,
  `estadoAsistencia` VARCHAR(400) NOT NULL,
  `fkidAsignatura` INT NOT NULL,
  PRIMARY KEY (`idAsistencia`),
  CONSTRAINT `fk_Asistencia_Asignatura2`
    FOREIGN KEY (`fkidAsignatura`)
    REFERENCES `Asignatura` (`idAsignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE Asistencia AUTO_INCREMENT = 140100;

-- -----------------------------------------------------
-- Table `EstudiantesGradoGrupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EstudiantesGradoGrupo` ;

CREATE TABLE IF NOT EXISTS `EstudiantesGradoGrupo` (
  `idEstudianteGG` INT NOT NULL AUTO_INCREMENT,
  `rendimientoGeneral` VARCHAR(400) NULL,
  `estadoEstudianteGG` VARCHAR(400) NOT NULL,
  `fkidEstudiante` INT NOT NULL,
  `fkidGradoGrupo` INT NOT NULL,
  PRIMARY KEY (`idEstudianteGG`),
  CONSTRAINT `fk_EstudiantesGrupo_Estudiante1`
    FOREIGN KEY (`fkidEstudiante`)
    REFERENCES `Estudiante` (`idEstudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_EstudiantesGrupo_GradoGrupo1`
    FOREIGN KEY (`fkidGradoGrupo`)
    REFERENCES `GradoGrupo` (`idGradoGrupo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE EstudiantesGradoGrupo AUTO_INCREMENT = 200100;

-- -----------------------------------------------------
-- Table `DocenteAsignatura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DocenteAsignatura` ;

CREATE TABLE IF NOT EXISTS `DocenteAsignatura` (
  `idDocenteAsignatura` INT NOT NULL AUTO_INCREMENT,
  `estadoDocenteAsignatura` VARCHAR(400) NOT NULL,
  `fkidDocente` INT NOT NULL,
  `fkidAsignatura` INT NOT NULL,
  PRIMARY KEY (`idDocenteAsignatura`),
  CONSTRAINT `fk_DocenteAsignatura_Docente1`
    FOREIGN KEY (`fkidDocente`)
    REFERENCES `Docente` (`idDocente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DocenteAsignatura_Asignatura1`
    FOREIGN KEY (`fkidAsignatura`)
    REFERENCES `Asignatura` (`idAsignatura`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE DocenteAsignatura AUTO_INCREMENT = 210100;

-- -----------------------------------------------------
-- Table `DocentesGrado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `DocentesGrado` ;

CREATE TABLE IF NOT EXISTS `DocentesGrado` (
  `idDocenteGrado` INT NOT NULL AUTO_INCREMENT,
  `estadoDocenteGrado` VARCHAR(400) NOT NULL,
  `fkidDocente` INT NOT NULL,
  `fkidGrado` INT NOT NULL,
  PRIMARY KEY (`idDocenteGrado`),
  CONSTRAINT `fk_DocentesGrado_Docente1`
    FOREIGN KEY (`fkidDocente`)
    REFERENCES `Docente` (`idDocente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_DocentesGrado_Grados1`
    FOREIGN KEY (`fkidGrado`)
    REFERENCES `Grados` (`idGrado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE DocentesGrado AUTO_INCREMENT = 215100;

-- -----------------------------------------------------
-- Table `AsistenciaEstudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `AsistenciaEstudiante` ;

CREATE TABLE IF NOT EXISTS `AsistenciaEstudiante` (
  `idAsistenciaGradoGrupo` INT NOT NULL AUTO_INCREMENT,
  `estadoAsistencia` VARCHAR(400) NOT NULL,
  `fkidAsistencia` INT NOT NULL,
  `fkidEstudianteGG` INT NOT NULL,
  PRIMARY KEY (`idAsistenciaGradoGrupo`),
  CONSTRAINT `fk_AsistenciaEstudiante_Asistencia1`
    FOREIGN KEY (`fkidAsistencia`)
    REFERENCES `Asistencia` (`idAsistencia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AsistenciaEstudiante_EstudiantesGradoGrupo1`
    FOREIGN KEY (`fkidEstudianteGG`)
    REFERENCES `EstudiantesGradoGrupo` (`idEstudianteGG`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE AsistenciaEstudiante AUTO_INCREMENT = 218100;

-- -----------------------------------------------------
-- Table `TipoNota`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TipoNota` ;

CREATE TABLE IF NOT EXISTS `TipoNota` (
  `idTipoNota` INT NOT NULL AUTO_INCREMENT,
  `tipoNota` VARCHAR(400) NOT NULL,
  `porcentajeNota` VARCHAR(400) NOT NULL,
  `estadoNota` VARCHAR(400) NOT NULL,
  PRIMARY KEY (`idTipoNota`));

ALTER TABLE TipoNota AUTO_INCREMENT = 278100;

-- -----------------------------------------------------
-- Table `NotasEstudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `NotasEstudiante` ;

CREATE TABLE IF NOT EXISTS `NotasEstudiante` (
  `idNotaEstudiante` INT NOT NULL AUTO_INCREMENT,
  `estadoNota` VARCHAR(400) NOT NULL,
  `notaDefinitiva` FLOAT NOT NULL,
  `fkidEstudianteGG` INT NOT NULL,
  `fkidTipoNota` INT NOT NULL,
  `fkidNotaDefinitivaPeriodo` INT NOT NULL,
  PRIMARY KEY (`idNotaEstudiante`),
  CONSTRAINT `fk_NotasEstudiante_EstudiantesGradoGrupo1`
    FOREIGN KEY (`fkidEstudianteGG`)
    REFERENCES `EstudiantesGradoGrupo` (`idEstudianteGG`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NotasEstudiante_TipoNota1`
    FOREIGN KEY (`fkidTipoNota`)
    REFERENCES `TipoNota` (`idTipoNota`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_NotasEstudiante_NotaDefinitivaPeriodo1`
    FOREIGN KEY (`fkidNotaDefinitivaPeriodo`)
    REFERENCES `NotaDefinitivaPeriodo` (`idNotas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE NotasEstudiante AUTO_INCREMENT = 278200;

-- -----------------------------------------------------
-- Table `Acudiente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Acudiente` ;

CREATE TABLE IF NOT EXISTS `Acudiente` (
  `identificacionFamiliar` BIGINT NOT NULL,
  `nombreFamiliar` VARCHAR(400) NOT NULL,
  `apellidoFamiliar` VARCHAR(400) NOT NULL,
  `correoFamiliar` VARCHAR(400) NULL,
  `celularFamiliar` VARCHAR(400) NULL,
  `parentescoEstudiante` VARCHAR(400) NOT NULL,
  `responsabilidadEconomicaEstudiante` VARCHAR(450) NOT NULL,
  `estadoAcudiente` VARCHAR(400) NOT NULL,
  `Genero_idGenero` INT NOT NULL,
  `Estudiante_idEstudiante` INT NOT NULL,
  PRIMARY KEY (`identificacionFamiliar`),
  CONSTRAINT `fk_Familiar_Genero1`
    FOREIGN KEY (`Genero_idGenero`)
    REFERENCES `Genero` (`idGenero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Familiar_Estudiante1`
    FOREIGN KEY (`Estudiante_idEstudiante`)
    REFERENCES `Estudiante` (`idEstudiante`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
