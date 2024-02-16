/*CASOS DE PRUEBA PARA LA VALIDACION DE PROCEDIMIENTOS Y FUNCIONES*/
use bdcolegio;
GRANT EXECUTE ON PROCEDURE bdColegio.obtenerCodigoEstudiantes TO 'root'@'localhost';
GRANT EXECUTE ON FUNCTION bdColegio.ObtenerCodigoEstudiante TO 'root'@'localhost';
FLUSH PRIVILEGES;

call registrarTipoSangre("O+");
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

select * from sisben;
select * from estrato;
select * from eps;
select * from discapacidad;
select * from tipodocumento;
select * from tiposangre;
select * from genero;

call mostrarEstudiantes();
/*select ObtenerNombreTipoDocumento(());*/

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
call registrarFamiliar(1117568978,"Alguien Roberto", "Hus Hus", null, "312654987", "Padre", "Completa", "Hombre", 1118377419);
call registrarFuncionario(12368974, "Alguien", null, "Soy", "Yo", 30, "321654", null, "AlguienSoyYo@Jhu.lalo", "Donde tu quieras", null, "2023-12-15", "O+", "CC", 
						  "Ninguna", "Ninguno", "Masculino", "CAPRECOM EPS", "4", null, "Alta Aguililla");
call registrarObservacionEst("Pinche decerebrado pelion", "1118377419", "12368974");
select ObtenerIdFuncionario((SELECT CAST('12368974' AS SIGNED)));                          
                          
                          