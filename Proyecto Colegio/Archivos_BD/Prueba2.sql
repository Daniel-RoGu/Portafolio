


call registrarDocente(null, "LA AGUILILLA", "1234", "PUERTO RICO", "Prueba", null, "Test1", null, null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);
call registrarDocente(null, "LA AGUILILLA", "1235", "PUERTO RICO", "Prueba2", null, "Test2", null, null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);
call registrarDocenteGrado2((select ObtenerIdDocente(1235)), 7);
call RegistrarAsignaturaGrupoDocente(187027, 207007, "Matemáticas");
call RegistrarAsignaturaGrupoDocente(187026, 207007, "Religión");
call registrarDocenteAsignatura("Prueba Test1", "Matemáticas");

select FunExisteDocenteAsignaturaGrado(187026, "Matemáticas", "7");
call registrarGradoGrupo("7", "702");