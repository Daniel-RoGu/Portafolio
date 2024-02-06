
	/*Drop database bdColegio;
    Create database bdColegio;*/
    Use bdColegio;


-- -----------------------------------------------------
-- Table `TipoDocumento`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `TipoDocumento` ;

CREATE TABLE IF NOT EXISTS `TipoDocumento` (
  `idTipoDocumento` INT NOT NULL AUTO_INCREMENT,
  `nombreTipoDocumento` VARCHAR(45) NOT NULL,
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

ALTER TABLE TipoSangre AUTO_INCREMENT = 200;

-- -----------------------------------------------------
-- Table `Discapacidad`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Discapacidad` ;

CREATE TABLE IF NOT EXISTS `Discapacidad` (
  `idDiscapacidad` INT NOT NULL AUTO_INCREMENT,
  `nombreDiscapacidad` VARCHAR(45) NOT NULL,
  `estadoDiscapacidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDiscapacidad`));

ALTER TABLE Discapacidad AUTO_INCREMENT = 300;

-- -----------------------------------------------------
-- Table `Sisben`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Sisben` ;

CREATE TABLE IF NOT EXISTS `Sisben` (
  `idSisben` INT NOT NULL AUTO_INCREMENT,
  `nombreSisben` VARCHAR(45) NOT NULL,
  `estadoSisben` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idSisben`));

ALTER TABLE Sisben AUTO_INCREMENT = 600;

-- -----------------------------------------------------
-- Table `Rol`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Rol` ;

CREATE TABLE IF NOT EXISTS `Rol` (
  `idRol` INT NOT NULL AUTO_INCREMENT,
  `nombreRol` VARCHAR(45) NOT NULL,
  `estadoRol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idRol`));

ALTER TABLE Rol AUTO_INCREMENT = 800;

-- -----------------------------------------------------
-- Table `Estrato`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Estrato` ;

CREATE TABLE IF NOT EXISTS `Estrato` (
  `idEstrato` INT NOT NULL AUTO_INCREMENT,
  `nombreEstrato` VARCHAR(45) NOT NULL,
  `estadoEstrato` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEstrato`));

ALTER TABLE Estrato AUTO_INCREMENT = 900;

-- -----------------------------------------------------
-- Table `EPS`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `EPS` ;

CREATE TABLE IF NOT EXISTS `EPS` (
  `idEPS` INT NOT NULL AUTO_INCREMENT,
  `nombreEPS` VARCHAR(45) NOT NULL,
  `estadoEPS` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEPS`));

ALTER TABLE EPS AUTO_INCREMENT = 1100;

-- -----------------------------------------------------
-- Table `Genero`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Genero` ;

CREATE TABLE IF NOT EXISTS `Genero` (
  `idGenero` INT NOT NULL AUTO_INCREMENT,
  `nombreGenero` VARCHAR(45) NOT NULL,
  `estadoGenero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGenero`));

ALTER TABLE Genero AUTO_INCREMENT = 2000;

-- -----------------------------------------------------
-- Table `Usuario`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Usuario` ;

CREATE TABLE IF NOT EXISTS `Usuario` (
  `identificacion` INT NOT NULL AUTO_INCREMENT,
  `nombreUsuario` VARCHAR(45) NOT NULL,
  `segundoNombreUsuario` VARCHAR(45) NULL,
  `primerApellidoUsuario` VARCHAR(45) NOT NULL,
  `segundoApellidoUsuario` VARCHAR(45) NULL,
  `edadUsuario` INT NOT NULL,
  `telefonoCelular` VARCHAR(10) NULL,
  `telefonoFijo` VARCHAR(45) NULL,
  `correo` VARCHAR(45) NULL,
  `direccion` VARCHAR(200) NULL,
  `barrioUbicacionUsuario` VARCHAR(45) NULL,
  `fechaNacimiento` VARCHAR(45) NOT NULL,
  `estadoUsuario` VARCHAR(45) NOT NULL,
  `fkidTipoDocumento` INT NOT NULL,
  `fkidTipoSangre` INT NOT NULL,
  `fkidDiscapacidad` INT NOT NULL,
  `fkidSisben` INT NOT NULL,
  `fkidRol` INT NOT NULL,
  `fkidEstrato` INT NOT NULL,
  `fkidEPS` INT NOT NULL,
  `fkidGenero` INT NOT NULL,
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
  `nombrePermiso` VARCHAR(45) NOT NULL,
  `estadoPermiso` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPermiso`));

ALTER TABLE Permiso AUTO_INCREMENT = 20000;

-- -----------------------------------------------------
-- Table `RolPermiso`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `RolPermiso` ;

CREATE TABLE IF NOT EXISTS `RolPermiso` (
  `idRolPermiso` INT NOT NULL AUTO_INCREMENT,
  `nombreVista` VARCHAR(50) NOT NULL,
  `vistaRaiz` VARCHAR(50) NOT NULL,
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
  `identificacionAcudiente` INT NULL,
  `nombreAcudiente` VARCHAR(45) NULL,
  `apellidoAcudiente` VARCHAR(45) NULL,
  `generoAcudiente` VARCHAR(45) NULL,
  `correoAcudiente` VARCHAR(45) NULL,
  `celularAcudiente` VARCHAR(45) NULL,
  `parentescoAcudiente` VARCHAR(45) NULL,
  `responsabilidadEconomicaAcudiente` VARCHAR(100) NULL,
  `codigoEstudiante` VARCHAR(45) NOT NULL,
  `ciudadNacimiento` VARCHAR(45) NULL,
  `ciudadResidencia` VARCHAR(45) NULL,
  `ciudadExpedicionDocumento` VARCHAR(45) NULL,
  `paisOrigen` VARCHAR(45) NOT NULL,
  `asistenciaAcademicaEspecial` VARCHAR(200) NOT NULL,
  `desplazadoEstado` VARCHAR(45) NULL,
  `Usuario_identificacion` INT NOT NULL,
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
  `nombreModalidad` VARCHAR(45) NOT NULL,
  `estadoModalidad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idModalida_Educativa`));

ALTER TABLE Modalida_Educativa AUTO_INCREMENT = 31000;

-- -----------------------------------------------------
-- Table `Sede`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Sede` ;

CREATE TABLE IF NOT EXISTS `Sede` (
  `idSede` INT NOT NULL AUTO_INCREMENT,
  `nombreSede` VARCHAR(45) NOT NULL,
  `internadoDisponibilidad` VARCHAR(45) NOT NULL,
  `estadoSede` VARCHAR(45) NOT NULL,
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
  `estadoDocente` VARCHAR(45) NOT NULL,
  `horasLaboralesSemanales` INT NOT NULL,
  `fkidentificacion` INT NOT NULL,
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
  `estadoFuncionario` VARCHAR(45) NOT NULL,
  `Usuario_identificacion` INT NOT NULL,
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
  `nombreGrado` VARCHAR(45) NOT NULL,
  `estadoGrado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGrado`));

ALTER TABLE Grados AUTO_INCREMENT = 33200;

-- -----------------------------------------------------
-- Table `SedeGrados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SedeGrados` ;

CREATE TABLE IF NOT EXISTS `SedeGrados` (
  `idSedeGrados` INT NOT NULL AUTO_INCREMENT,
  `estadoGradoSede` VARCHAR(45) NOT NULL,
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
  `nombreGrupo` VARCHAR(45) NOT NULL,
  `estadoGrupo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idGrupo`));

ALTER TABLE Grupos AUTO_INCREMENT = 34500;

-- -----------------------------------------------------
-- Table `GradoGrupo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `GradoGrupo` ;

CREATE TABLE IF NOT EXISTS `GradoGrupo` (
  `idGradoGrupo` INT NOT NULL AUTO_INCREMENT,
  `nombreTitular` VARCHAR(100) NOT NULL,
  `estadoGrupoGrado` VARCHAR(45) NOT NULL,
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
  `horaInicio` VARCHAR(45) NOT NULL,
  `horaFin` VARCHAR(45) NOT NULL,
  `fechaHorario` VARCHAR(45) NOT NULL,
  `estadoHorario` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idHorario`));

ALTER TABLE Horario AUTO_INCREMENT = 36000;

-- -----------------------------------------------------
-- Table `Asignatura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Asignatura` ;

CREATE TABLE IF NOT EXISTS `Asignatura` (
  `idAsignatura` INT NOT NULL AUTO_INCREMENT,
  `nombreAsignatura` VARCHAR(45) NOT NULL,
  `estadoAsignatura` VARCHAR(45) NOT NULL,
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
  `estadoAsignaturaGrado` VARCHAR(45) NOT NULL,
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
  `periodoAcademico` VARCHAR(45) NOT NULL,
  `fechaInicio` VARCHAR(45) NOT NULL,
  `fechaFin` VARCHAR(45) NOT NULL,
  `estadoPeriodo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPeriodoAcademico`));

ALTER TABLE PeriodoAcademico AUTO_INCREMENT = 39000;

-- -----------------------------------------------------
-- Table `NotaFinal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `NotaFinal` ;

CREATE TABLE IF NOT EXISTS `NotaFinal` (
  `idNotaDefinitiva` INT NOT NULL AUTO_INCREMENT,
  `añoElectivo` VARCHAR(45) NOT NULL,
  `calificacionAño` FLOAT NOT NULL,
  `estadoCalificacionAño` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idNotaDefinitiva`));

ALTER TABLE NotaFinal AUTO_INCREMENT = 39100;

-- -----------------------------------------------------
-- Table `NotaDefinitivaPeriodo`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `NotaDefinitivaPeriodo` ;

CREATE TABLE IF NOT EXISTS `NotaDefinitivaPeriodo` (
  `idNotas` INT NOT NULL AUTO_INCREMENT,
  `notaGeneral` DOUBLE NOT NULL,
  `estadoNota` VARCHAR(45) NOT NULL,
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
  `nombreCompetencia` VARCHAR(450) NOT NULL,
  `objetivoCompetencia` VARCHAR(450) NOT NULL,
  `informacionCompetencia` VARCHAR(450) NULL,
  `estadoCompetencia` VARCHAR(45) NOT NULL,
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
  `jornada` VARCHAR(45) NOT NULL,
  `fechaInicio` VARCHAR(45) NOT NULL,
  `fechaFin` VARCHAR(45) NULL,
  `internadoEstado` VARCHAR(45) NOT NULL,
  `gradoEstudiante` VARCHAR(45) NOT NULL,
  `grupoEstudiante` VARCHAR(45) NOT NULL,
  `estadoMatricula` VARCHAR(45) NOT NULL,
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
  `estadoObservacion` VARCHAR(45) NOT NULL,
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
  `nFallas` VARCHAR(45) NOT NULL,
  `estadoAsistencia` VARCHAR(45) NOT NULL,
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
  `rendimientoGeneral` VARCHAR(45) NULL,
  `estadoEstudianteGG` VARCHAR(45) NOT NULL,
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
  `estadoDocenteAsignatura` VARCHAR(45) NOT NULL,
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
  `estadoDocenteGrado` VARCHAR(45) NOT NULL,
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
  `estadoAsistencia` VARCHAR(45) NOT NULL,
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
  `tipoNota` VARCHAR(45) NOT NULL,
  `porcentajeNota` VARCHAR(45) NOT NULL,
  `estadoNota` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idTipoNota`));

ALTER TABLE TipoNota AUTO_INCREMENT = 278100;

-- -----------------------------------------------------
-- Table `NotasEstudiante`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `NotasEstudiante` ;

CREATE TABLE IF NOT EXISTS `NotasEstudiante` (
  `idNotaEstudiante` INT NOT NULL AUTO_INCREMENT,
  `estadoNota` VARCHAR(45) NOT NULL,
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
