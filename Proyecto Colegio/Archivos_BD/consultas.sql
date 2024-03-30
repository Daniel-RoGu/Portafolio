/*CASOS DE PRUEBA PARA LA VALIDACION DE PROCEDIMIENTOS Y FUNCIONES*/
use bdcolegio;
GRANT EXECUTE ON PROCEDURE bdColegio.obtenerCodigoEstudiantes TO 'root'@'localhost';
GRANT EXECUTE ON FUNCTION bdColegio.ObtenerCodigoEstudiante TO 'root'@'localhost';
FLUSH PRIVILEGES;

call registrarTipoSangre("O +");
call registrarTipoDocumento("TI");
call registrarTipoDocumento("CC");
call registrarDiscapacidad("Limitaciones Motoras");
call registrarDiscapacidad("Ninguna");
call registrarGenero("Hombre");
call registrarGenero("Mujer");
call registrarEPS("PaJoderte");
call registrarEstrato("NiExiste");
call registrarRol("ElJefe");
call registrarRol("Estudiante");
call registrarRol("Coordinador");
call registrarRol("Docente");
call registrarRol("Administrador");
call registrarPermiso("RegistrarTipoDocumento");
call registrarRolPermiso("vistaRegistroTipoDocumento", "Views/TipoDocumento", "ElJefe", "RegistrarTipoDocumento"); /*luego se remplaza el nombre de la vista por el http//algo.com*/
call registrarSisben("Ninguno");
call registrarUsuario(123, "Alguien", null, "Soy", "Yo", 30, "321654", null, "AlguienSoyYo@Jhu.lalo", "Donde tu quieras", null, "2023-12-15", "O+", "TI", "Ninguna", "Ninguno", "Jhulian", "PaJoderte", "NiExiste", "ElJefe");

call registrarEstudiante(123, "Alguien", null, "Soy", "Yo", 30, "321654", null, "AlguienSoyYo@Jhu.lalo", "Donde tu quieras", null, "2023-12-15", "O+", "TI", 
						 "Ninguna", "Ninguno", "Jhulian", "PaJoderte", "NiExiste", "3216", "ElHueco", "ElOtroHueco", "ElHueco", "Aqui", "Toca", "No");
call registrarAcudiente(98747, "Tutoi", "Pepinto", "Elpepinto@putoi.com", null, "Papi", "Toda no hace nada", "Jhulian", 123);

call registrarModalidadEducativa("Nueva escuela");
call registrarModalidadEducativa("Sin definir");
call registrarSede("JoPutos", "No", "Nueva escuela");
call registrarDocente(24, 12345, "JoPutos", "Alguien", null, "Soy", "Yo", 30, "321654", null, "AlguienSoyYo@Jhu.lalo", "Donde tu quieras", null, "2023-12-15", "O+", "TI", "Ninguna", "Ninguno", "Jhulian", "PaJoderte", "NiExiste", "ElJefe");

select ObtenerIdRol("ElJefe");
select ObtenerIdPermiso("RegistrarTipoDocumento");
select ObtenerIdTipoSangre("O+");

select count(*) from estudiante;
select count(*) from usuario;
select count(*) from matricula;
SHOW STATUS LIKE 'Threads_connected';
SELECT * FROM performance_schema.threads;

select * from sisben;
select * from estrato;
select * from eps;
select * from discapacidad;
select * from tipodocumento;
select * from tiposangre;
select * from genero;

call mostrarEstudiantes();
call mostrarEstudiantes2();
select Us.identificacion From Usuario as Us
inner join Estudiante on Estudiante.Usuario_identificacion = Us.identificacion;

call obtenerCodigoEstudiantes('1029565035');
select ObtenerNombreSisben(616);
select ObtenerNombreTipoDocumento();
call existeEstudiante('1029560098');
call existeEstudiante('10295');
call existeEPS('Nueva EPS');
call existeEPS('Vieja EPS');
call existeTpSangre('O+');
call existeTpSangre('O +');
call existeTpDocumento('Pasaporte');
call existeTpDocumento('TI');
call existeDiscapacidad('Sordo-ceguera');
call existeDiscapacidad('Sordo-Seguera');
call existeGenero('Masculino');
call existeGenero('M');
call existeSisben('A1');
call existeSisben('A8');

call registrarAsignatura('Probabilisticos');
call registrarTipoNota('Definitiva');
call registrarSede('Central');
call registrarFamiliar(1117568978,"Alguien Roberto", "Doctor", null, "312654987", "Padre", "Completa", "MASCULINO", 1118377419);
call registrarFamiliar(1117568978,"Alguien Roberto", "Doctor", null, "312654987", "Padre", "Si", "No", "No", "1981-12-18", "Bachiller", "Florencia", "MASCULINO", 1118377419);
call obtenerFamiliaresEstudiante("1118377419");
select ObtenerIdEstudiante("1118377419");

call registrarFuncionario(12368974, "Alguien", null, "Soy", "Yo", 30, "321654", null, "AlguienSoyYo@Jhu.lalo", "Donde tu quieras", null, "2023-12-15", "O+", "CC", 
						  "Ninguna", "Ninguno", "Masculino", "CAPRECOM EPS", "4", null, "Alta Aguililla");
call registrarFuncionario(12987357, "Eva", null, "Sukuy", "Turu", 45, "32165584", null, "Alguien@Tu.lalo", "Donde", null, "1981-12-18", "O +", "CC", 
						  "Ninguna", "Ninguno", "Femenino", "CAPRECOM EPS", "5", null, "Central");

SELECT CAST("12987357" AS SIGNED);
(select ObtenerIdFuncionario((SELECT CAST("12987357"AS SIGNED))));
call registrarObservacionEst("Pinche decerebrado pelion", "1118377419", "12368974");
select ObtenerIdFuncionario((SELECT CAST('12368974' AS SIGNED)));   
call obtenerEstudiante('106657');
                       
call ObtenerSedes();                       
call ObtenerTipoSangre();                       
call ObtenerTipoDocumento();                       
call obtenerDiscapacidad();                       
call obtenerSisben();                       
call obtenerGenero();                       
call obtenerEPS();                       
call obtenerEstrato();                       

call registrarDocente(24, "Central", "12654987", "Jhulius", null, "Rommanus", "Magnus", 45, "365987465", "654987", null, "cerca al barrio", "El barrio",
					  "1979-12-15", "O+", "CC", "Ninguna", "Ninguno", "Masculino", "CAPRECOM EPS", "4");
call registrarDocente(24, "Central", "12987137", "Edector", null, "Cumbai", "Cutui", 45, "365987465", "654987", null, "cerca al barrio", "El barrio",
					  "1979-12-15", "O+", "CC", "Ninguna", "Ninguno", "Masculino", "CAPRECOM EPS", "4");
call registrarDocente(25, "Central", "12987852", "Ana", null, "Riquianus", "Mamus", 38, "364659518", "231687", null, "cerca al otto barrio", "El barrio2",
					  "1986-01-15", "O+", "CC", "Ninguna", "Ninguno", "Femenino", "CAPRECOM EPS", "4");
call registrarDocente(24, "EL VATICANO", "12357189", "Eva", null, "Mamus", "Mamus", 32, "359789654", "357753", null, "lejos al otto barrio", "El barrio3",
					  "1980-12-18", "O+", "CC", "Ninguna", "Ninguno", "Femenino", "CAPRECOM EPS", "4");
call registrarDocente(24, "EL VATICANO", "12351998", "Ximena", null, "Magnus", "Mamus", 28, "359789654", "357753", null, "lejos al ottto barrio", "El barrio3",
					  "1996-12-18", "O+", "CC", "Ninguna", "Ninguno", "Femenino", "CAPRECOM EPS", "3");
select ObtenerIdSede("Central");

call registrarMatricula("Mañana", "2024-01-02", null, "No", "8", "802", "1118377419", "12368974", "Central");
call registrarMatricula("Mañana", "2024-01-02", null, null, "9", "901", "1118072041", "12987357", "Central");

call existeSede("Central");
call existeSede("Central2");
call existeGrado("12");
call existeGrupoGrado("1202");
call registrarGrado("11");
call registrarGrado("10");
call registrarGrado("12");
call registrarGradoGrupo("12", "1202");
select ObtenerIdGrado("12");
call registrarGradoGrupo("11", "1102");
call registrarSedeGrado("Central", "12");
call registrarSedeGrado("Central", "1");
call registrarSedeGrado("Central", "11");
call registrarSedeGrado("Central", "10");
call registrarEstudiantesGradoGrupo('1118377419', "1202");
call registrarEstudiantesGradoGrupo('1118373676', "1202");
select ObtenerIdGradoGrupo(1202);

call existeSedeGrado("Central", "12");
call existeEstudianteGrupoGrado("1118377419", "1202");
call existeEstudianteGrupoGrado("1118377419", "1102");
call existeMatricula("1118377419", "12368974", "Central");
call existeMatricula("1118073184", "12368974", "Central");
call existeModalidad("Sin definir");
call existeModalidad("Nueva Escuela");
call existeDocente("12357951");
call existeDocenteGrado("12654987", "12");
call existeDocenteGrado("12357951", "12");

select ObtenerIdDocente((select CAST("12357951" AS SIGNED)));
select ObtenerIdGrado("12");
call obtenerSedeDocente("12987852");
/*call registrarDocenteGrado("12357951", "12");*/
call registrarDocenteGrado("Ana Riquianus Mamus", "1202");
call registrarDocenteGrado("Edector Cumbai Cutui", "101");
call registrarDocenteGrado("Jhulius Rommanus Magnus", "1202");
call registrarDocenteGrado("dfgdfg dfgdfgdfdgfgdfg dfgdfg", "1202");
call registrarDocenteGrado("werwqer wrewqerqwerqwer wrwqerqw", "501");
call registrarDocenteGrado("werwqer wrewqerqwerqwer wrwqerqw", "101");
call registrarDocenteGrado("werwqer wrewqerqwerqwer wrwqerqw", "201");
call registrarDocenteGrado("werwqer wrewqerqwerqwer wrwqerqw", "301");
call registrarDocenteGrado("werwqer wrewqerqwerqwer wrwqerqw", "401");
call registrarAsignatura("Español");
call registrarAsignatura("Matemáticas");
call registrarDocenteAsignatura("Edector Cumbai Cutui", "Español");
call registrarDocenteAsignatura("dfgdfg dfgdfgdfdgfgdfg dfgdfg", "Español");
call registrarAsignaturaGradoGrupo("Español", 1202);
call registrarAsignaturaGradoGrupo("Matemáticas", 1202);
call registrarAsignaturaGradoGrupo("Inglés", 1202);
call registrarAsignaturaGradoGrupo("Español", 101);
call registrarAsignaturaGradoGrupo("Matemáticas", 101);
call registrarAsignaturaGradoGrupo("Inglés", 101);
select FunExisteDocenteAsignaturaGrado(187000, "Inglés", 207010);

call registrarCompetenciasAsignatura("Lectura critica", "Dominar la lectura critica", "El estudiante debe ser bueno en LC", "Español");
select existeGradoRetorno("12");
call existeDocenteAsignatura("Edector Cumbai Cutui", "Español");
call existeDocenteAsignatura("Edector Cumbai Cutui", "Matemáticas");
call existeDocenteGrado("Jhulius Rommanus Magnus", "1202");
call existeDocenteGrado("Jhulius Rommanus Magnus", "1202");
call existeDocenteGrado("Ana Riquianus Mamus", "1202");
call existeDocenteGrado("Prueba Registro Docente", "1202");
call existeAsignaturaGradoGrupo("Español", 1202);
call existeAsignaturaGradoGrupo("Matemáticas", 1202);
call existeCompetencia("Lectura critica", "Español");
call existeCompetencia("Lectura critica", "Matemáticas");
call existeUsuarioLogin("12357951", "12357951");
call existeUsuarioLogin("12357951", "12357958");
call existeDocenteAsignaturaGrupo("Edector Cumbai Cutui", "Español", 1202);
call existeDocenteAsignaturaGrupo("Edector Cumbai Cutui", "Matemáticas", 1202);

select count(*) from gradogrupo;                          
select count(*) from estudiantesgradogrupo;                          
select count(*) from sedegrados;                          
select count(*) from sede;                          
select count(*) from grados;
select count(*) from asignatura;

call obtenerAsignaturas();
call obtenerDocente("12357951");
call obtenerDocentes();
call obtenerGruposGrado();
call obtenerGrados();
call obtenerRolUsuario("12987852");
call obtenerEstudiantesGrupo("201");
call obtenerEstudiantesGrupo("1202");
call obtenerEstudiantesGrupo("701");
call obtenerEstudiantesGrupo("901");
call obtenerEstudiantesSedeGrupo("Central", "1202");
call obtenerEstudiantesSedeGrupo("EL VATICANO", "101");
call obtenerEstudiantesSedeGrupo("NIEVES ARRIBA KM. 18", "701");
call obtenerEstudiantesSede("Central");
call obtenerEstudiantesSede("EL VATICANO");
call obtenerEstudiantesSede2("EL VATICANO");
call obtenerGruposGradoSede("EL VATICANO", "5");
call obtenerGradosXSede("EL VATICANO");
call obtenerGruposGradoSede("Central");
call obtenerGradosXSede("Central");
call ObtenerDocenteSede("EL VATICANO");
call ObtenerDocenteSede("Central");
call ObtenerInfoDocenteSede("Central");
call ObtenerInfoDocenteSede("EL VATICANO");
call obtenerGradoYGrupoEstudiante("1118377419");
call ObtenerDocentesSedeGrado("Central", "101");
call ObtenerDocentesSedeGrado("Central", "1202");
call ObtenerInfoDocentesSedeGrado("Central", "1202");

select ObtenerNombreSede('186800');
select ObtenerNombreEPS('2000');

select g.nombreGrado from Grados as g
inner join GradoGrupo as gg 
on gg.fkidGrado = g.idGrado and gg.grupoGrado = "1202";

select CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
			  COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, '')) as NombresCompletos
from usuario as u;

SELECT d.idDocente 
FROM docente AS d
INNER JOIN usuario AS u ON CONCAT(COALESCE(u.primerNombreUsuario, ''), ' ', COALESCE(u.segundoNombreUsuario, ''), 
								  COALESCE(u.primerApellidoUsuario, ''), ' ', COALESCE(u.segundoApellidoUsuario, '')) = "Edector Cumbai Cutui"
WHERE d.fkidentificacion = u.identificacion;
                          
select g.idGrado from gradogrupo as gg 
inner join Grados as g on gg.fkidGrado = g.idGrado
where gg.grupoGrado = "1202";


CALL RegistrarHorario("Central", "");

call ObtenerInfoDocentesTodos();
call ObtenerInfoGradosAsignaturasDocentes(187000);
call ObtenerGradosAsignaturasDocentes(187000);
call ObtenerAsignaturasGrado("Central", "207010");
call ObtenerInfoFamiliaresEstudiante_Certificados('1118073451');
call RegistrarHorario("Central", "Español", "1202", 585, "Lunes", "06:00-07:00");
call RegistrarHorario("Central", "Español", "1202", 585, "Viernes", "06:00-07:00");
call RegistrarHorario("Central", "Matemáticas", "1202", 585, "Lunes", "06:00-07:00");
call MostrarHorario("Central", "1202");
call MostrarHorarioPorRango("Central", "1202", "06:00-07:00", "Lunes");

INSERT INTO horarioGradoGrupo (estadoHorarioGG, fkidHorario, fkidGradoGrupo) 
VALUES ("Asignado", (SELECT ObtenerIdHorario(horaInicioClase, horaFinClase)), grupoSelect);

select existeDocenteHorario((select ObtenerIdDocente(187000)), "06:00-07:00", "Lunes");
select existeGrupoHorario("1202", "06:00-07:00", "Lunes");
select existeAsignaturaHorario("Español", "06:00-07:00", "Lunes");
select existeHorario("06:00-07:00", "Lunes");

SELECT ObtenerIdAsignatura("Español");
SELECT ObtenerIdHorario("06:00-07:00", "Lunes");
SELECT ObtenerIdDocente(585);
select ObtenerIdGradoDelGrupo("1202");
SELECT ObtenerIdHorario(horaInicioClase, horaFinClase);
call AsignaturasDelDocente("LA AGUILILLA", 207006, 96360868);
call AsignaturasDelDocente("LA AGUILILLA", "6", 96360868);
call ObtenerDocentesAsignatura("Español");
call ObtenerAsignaturasGrado("LA AGUILILLA", 207006);
call ObtenerDocenteGrupos("LA AGUILILLA", "0", 1116919521);
call ObtenerDocenteGrados("LA AGUILILLA", 40730500);
call ObtenerDocenteGrados("LA AGUILILLA", 1116919521);
select ObtenerIdGrado("0");
call obtenerSedeDocente("585");
call obtenerSedeEstudiante(1013362165);
call obtenerSedeFuncionario(12987357);
call obtenerEstudiantesSedeGrupo2("LA AGUILILLA", "601");

call registrarDocenteNotasAsistenciasPeriodo("werwqer wrewqerqwerqwer wrwqerqw", "Español", 1117936646, "Primer periodo", 3.5, 5);
select ObtenerIdAsignatura("Proyecto Pedagógico Productivo");

SELECT Asignatura.idAsignatura FROM Asignatura WHERE Asignatura.nombreAsignatura = "Proyecto Pedagógico Agroecológico" LIMIT 1;
call registrarDocenteAsignatura("WILLIAM GARCIA MEDINA", "Informática"); 
call registrarDocenteAsignatura("WILLIAM GARCIA MEDINA", "Edu. Física"); 
call RegistrarAsignaturaGrupoDocente(187008, 207006, "Matemáticas");
call ObtenerGradosAsignaturasDocentes(187008);
call ObtenerInfoDocentesSedeGrado("LA AGUILILLA", "5");
													/*No es codigo es doc*/
call registrarDocenteNotasAsistenciasPeriodo("Matemáticas", 106602, "Primer Periodo", 3.0, 8);
call registrarDocenteNotasAsistenciasPeriodo("Matemáticas", 106602, "Segundo Periodo", 3.5, 2);
call registrarDocenteNotasAsistenciasPeriodo("Matemáticas", 106602, "Tercer Periodo", 3.8, 3);
call registrarDocenteNotasAsistenciasPeriodo("Matemáticas", 106602, "Cuarto Periodo", 2.0, 1);
call registrarDocenteNotasAsistenciasPeriodo("Convivencia", 106602, "Primer Periodo", 2.0, 1);

call registrarDocenteNotasAsistenciasPeriodo("Matemáticas", 106623, "Primer Periodo", 3.5, 4);
call registrarDocenteNotasAsistenciasPeriodo("Matemáticas", 106623, "Segundo Periodo", 3.5, 2);
call registrarDocenteNotasAsistenciasPeriodo("Matemáticas", 106623, "Tercer Periodo", 3.8, 3);
call registrarDocenteNotasAsistenciasPeriodo("Matemáticas", 106623, "Cuarto Periodo", 2.0, 1);

call registrarDocenteNotasAsistenciasPeriodo("Matemáticas", 106684, "Primer Periodo", 3.2, 6);
call registrarDocenteNotasAsistenciasPeriodo("Matemáticas", 106684, "Segundo Periodo", 3.5, 1);
call registrarDocenteNotasAsistenciasPeriodo("Matemáticas", 106684, "Primer Periodo", 3.8, 3);
call registrarDocenteNotasAsistenciasPeriodo("Matemáticas", 106684, "Tercer Periodo", 2.2, 4);

call registrarDocenteNotasAsistenciasPeriodo("Informática", 106684, "Primer Periodo", 3.2, 6);
call registrarDocenteNotasAsistenciasPeriodo("Informática", 106623, "Primer Periodo", 3.2, 6);
call registrarDocenteNotasAsistenciasPeriodo("Matemáticas", 106688, "Primer Periodo", 4, 6);
call registrarDocenteNotasAsistenciasPeriodo("Matemáticas", 106688, "Primer Periodo", 4.5, 3);
select ObtenerIdAsignatura("Matemáticas");
select obtenerIdPeriodo("Cuarto Periodo");
select obtenerIdAsistenciaAsignaturaPeriodo("Primer Periodo", "Matemáticas");
call ObtenerNotasInasistenciasEstudiantesXGrupo(106602, "Matemáticas", "Cuarto Periodo");
call ObtenerNotasInasistenciasEstudiantesXGrupo(106623, "Matemáticas", "Primer Periodo");
call ObtenerNotasInasistenciasEstudiantesXGrupo(106684, "Matemáticas", "Primer Periodo");

select obtenerIdNotaEstudianteAsignatura(106688, "Matemáticas", "Primer Periodo");
select FunexisteNotasEstudianteAsignatura(106688, "Matemáticas", "Primer Periodo");

call ObtenerNotasEstudiantes("Matemáticas", "Primer Periodo");
drop FUNCTION obtenerNotaEstudiante;
call ObtenerPeriodoHabilitado();
call ActualizarEstadoPeriodo(0, "Segundo periodo");
call ActualizarEstadoPeriodo(0, "Tercer periodo");
call ActualizarEstadoPeriodo(0, "Cuarto periodo");

select ObtenerIdEstudiante(1117823890);
drop FUNCTION ObtenerNombreCompletoDocente;
select PeriodoAcademico.idPeriodoAcademico from PeriodoAcademico where PeriodoAcademico.periodoAcademico = "Segundo periodo";
select ObtenerIdAsignatura("Informática");
select obtenerNotaEstudiante(106684);
select obtenerIdNotasEstudiante(106684);

call ObtenerNotasInasistenciasEstudiantesTodosXGrupo(601, "Matemáticas", "Primer Periodo");
call ObtenerNotasInasistenciasEstudiantesTodosXGrupo2(601, "Matemáticas", "Segundo Periodo");
call ObtenerNotasInasistenciasEstudiantesTodosXGrupo2(601, "Matemáticas", "Tercer Periodo");
call ObtenerNotasInasistenciasEstudiantesTodosXGrupo2(601, "Matemáticas", "Cuarto Periodo");
call ObtenerEstudiantesTodosXGrupo(601, "Matemáticas", "Primer Periodo");

call GradosGruposAsignaturasDocentes("LA AGUILILLA", "7", "701");
call GradosAsignaturasDocentes("LA AGUILILLA", "7", "Matemáticas");
call ObtenerNombreDocente(96360868);
call AsignaturasDelDocente("LA AGUILILLA", "7", "701");
        
call RegistrarHorario("LA AGUILILLA", "Matemáticas", "701", 96360868, "Lunes", "06:00-07:00");       
call RegistrarHorario("LA AGUILILLA", "Matemáticas", "601", 96360868, "Viernes", "08:00-09:00");       
call MostrarHorarioPorRangoDocente(96360868, "LA AGUILILLA", "06:00-07:00", "Lunes");
call MostrarHorarioPorRangoDocente(96360868, "LA AGUILILLA", "08:00-09:00", "Viernes");
call ObtenerSumaNotasEstudiantes(106684, "Primer Periodo", 601);/*Reconsiderar - usarlo para calcular el promedio de la asignatura*/
call MostrarHorarioPorRangoEstudiante(1212213246, "LA AGUILILLA", "601", "08:00-09:00", "Viernes");
call MostrarHorarioPorRangoEstudiante(1117823890, "LA AGUILILLA", "701", "06:00-07:00", "Lunes");
/*1115948691*/						
call ObtenerGrupoEstudiante(1115948691);
call ObtenerGradoEstudiante(1115950341);
call ObtenerGradoEstudiante(1211713723);

call ObtenerEstudiantesNotasXGrupo("601", "Matemáticas", "Primer Periodo");
call ObtenerEstudiantesNotasXGrupo2(1115948691, "601", "Primer Periodo");
call ObtenerEstudiantesNotasXGrupoInfoParcial(1115948691, "601");

select obtenerInasistenciaEstudianteAsignatura(106602, "Matemáticas", "Primer Periodo");
select obtenerCargaHorariaAsignatura("Matemáticas", "601");
call ObtenerSumaNotaMateriaPeriodos(106684, "Matemáticas", "601");
call ObtenerNotasEstudiantesXMateria(1211713225, "Matemáticas", "Primer Periodo");
call ObtenerNotasEstudiantesXMateria(1211713225, "Matemáticas", "Segundo Periodo");
call ObtenerNotasEstudiantesXMateria(1211713225, "Matemáticas", "Tercer Periodo");
call ObtenerNotasEstudiantesXMateria(1211713225, "Matemáticas", "Cuarto Periodo");
select obtenerPromedioAsignaturaEstudiantePeriodo(106684, "Matemáticas", "601");
call ObtenerSumaInasistenciasMateriaPeriodos(106623, "Matemáticas", "601");
call ObtenerNombreEstudiante(1115948691);
call ObtenerPeriodosTodos();

call ActualizarDocentesTitularGrupo(187000, "701");
call ActualizarDocentesTitularGrupo(187008, "601");
call ObtenerDocentesTitularGrupo(187000);
        
select obtenerIdNotasEstudiante(106623); 
select obtenerIdPeriodo("Primer Periodo");
select ObtenerIdAsignatura("Matemáticas");
     
SELECT ObtenerIdEstudiante(1115948691);
select existeTitularGrupo("701");
call ObtenerGrupoSinTitular(207007);

/*  call registrarDocenteNotasAsistenciasPeriodo("Convivencia", 106602, "Primer Periodo", 2.0, 1);
	idEstudiante bigint, periodo varchar(400), nota float, docDocenteRef int, grupoRef varchar(400)*/
call ActualizarNotaConvivencia(106684, "Primer Periodo", 3.7, 187008, "601");

select ObtenerNombreCompletoDocente(96360868);
select esTitularGrupo("WILLIAM GARCIA MEDINA", "601");

call ObtenerInfoFamiliaresEstudiante_Certificados(106600);

call obtenerEstudiantesSedeGrupo2("LA AGUILILLA", "201");
call obtenerEstudianteSedeGrado("LA AGUILILLA", "2");

call ObtenerGrupoSinTitular(187008);
call ObtenerGrupoDelTitular(96360868);

select ObtenerNombreCompletoDocente(96360868);
/*(idEstudianteRef bigint, puestoRef int, asignaturaRef varchar(400), periodoRef varchar(400))*/
call ActualizarPosicionEstudiantes(1212213246, 4, "Matemáticas", "Primer Periodo");
