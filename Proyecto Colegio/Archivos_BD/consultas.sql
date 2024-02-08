use bdcolegio;

call registrarTipoSangre("O+");
call registrarTipoDocumento("TI");
call registrarDiscapacidad("Limitaciones Motoras");
call registrarDiscapacidad("Ninguna");
call registrarGenero("Jhulian");
call registrarEPS("PaJoderte");
call registrarEstrato("NiExiste");
call registrarRol("ElJefe");
call registrarRol("Estudiante");
call registrarPermiso("RegistrarTipoDocumento");
call registrarRolPermiso("vistaRegistroTipoDocumento", "Views/TipoDocumento", "ElJefe", "RegistrarTipoDocumento"); /*luego se remplaza el nombre de la vista por el http//algo.com*/
call registrarSisben("Ninguno");
call registrarUsuario(123, "Alguien", null, "Soy", "Yo", 30, "321654", null, "AlguienSoyYo@Jhu.lalo", "Donde tu quieras", null, "2023-12-15", "O+", "TI", "Ninguna", "Ninguno", "Jhulian", "PaJoderte", "NiExiste", "ElJefe");

call registrarEstudiante(123, "Alguien", null, "Soy", "Yo", 30, "321654", null, "AlguienSoyYo@Jhu.lalo", "Donde tu quieras", null, "2023-12-15", "O+", "TI", 
						 "Ninguna", "Ninguno", "Jhulian", "PaJoderte", "NiExiste", "3216", "ElHueco", "ElOtroHueco", "ElHueco", "Aqui", "Toca", "No");
call registrarAcudiente(98747, "Tutoi", "Pepinto", "Elpepinto@putoi.com", null, "Papi", "Toda no hace nada", "Jhulian", 123);

call registrarModalidadEducativa("Nueva escuela");
call registrarSede("JoPutos", "No", "Nueva escuela");
call registrarDocente(24, 12345, "JoPutos", "Alguien", null, "Soy", "Yo", 30, "321654", null, "AlguienSoyYo@Jhu.lalo", "Donde tu quieras", null, "2023-12-15", "O+", "TI", "Ninguna", "Ninguno", "Jhulian", "PaJoderte", "NiExiste", "ElJefe");

select ObtenerIdRol("ElJefe");
select ObtenerIdPermiso("RegistrarTipoDocumento");
select ObtenerIdTipoSangre("O+");

select count(*) from estudiante;
select count(*) from usuario;