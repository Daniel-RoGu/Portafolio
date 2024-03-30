use bdcolegio;

call registrarTipoDocumento("CC:CÉDULA DE CIUDADANÍA");
call registrarTipoSangre("O +");
call registrarRol("Estudiante");
call registrarRol("Coordinador");
call registrarRol("Docente");
call registrarRol("Administrador");
call registrarModalidadEducativa("Sin definir");
call registrarSede('LA AGUILILLA');
call registrarUsuario(9518, "Admin", null, "Admin", null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, "Administrador");
call registrarFuncionario(12987357, "Eva", null, "Sukuy", "Turu", 45, "32165584", null, "Alguien@Tu.lalo", "Donde", null, "1981-12-18", "O +", "CC:CÉDULA DE CIUDADANÍA", 
						  "Ninguna", "Ninguno", "Femenino", "CAPRECOM EPS", "5", null, "LA AGUILILLA");

/*---------------------------------------------------REGISTRO PERIODO ACADEMICO------------------------------------------------------*/
												/* dia/mes */	
call registrarPeriodoAcademico("Primer Periodo", "01/22", "04/05"); 
call registrarPeriodoAcademico("Segundo Periodo", "04/08", "06/14"); 
call registrarPeriodoAcademico("Tercer Periodo", "07/08", "09/13"); 
call registrarPeriodoAcademico("Cuarto Periodo", "09/16", "11/29"); 

/*--------------------------------------------------------REGISTRO GRADOS------------------------------------------------------------*/

call registrarGrado("0");                     
call registrarGrado("1");                     
call registrarGrado("2");                     
call registrarGrado("3");                     
call registrarGrado("4");                     
call registrarGrado("5");                     
call registrarGrado("6");                     
call registrarGrado("7");                     
call registrarGrado("8");                     
call registrarGrado("9");                     
call registrarGrado("10");                     
call registrarGrado("11");                     

/*--------------------------------------------------------REGISTRO ASIGNATURAS------------------------------------------------------------*/

/*---------- GRADO 0º ----------*/

INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("ActividadRectora_ARTE", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("ActividadRectora_JUEGO", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("ActividadRectora_MEDIO_AMBIENTE", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("ActividadRectora_LITERATURA", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("ActividadRectora_ETICA_Y_VALORES", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("DIMENSION_CORPORAL", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("DIMENSION_COMUNICATIVA", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("DIMENSION_ESTETICA", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("DIMENSION_ESPIRITUAL", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("DIMENSION_COGNITIVA", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("ETICA Y VALORES", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("DIMENSION_SOCIO_AFECTIVA", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("CONVIVENCIA", "Activa"); 

/*---------- GRADO Basica Primaria 1° a 5° ----------*/ /* Total, horas por grupo - 30*/
/*---------- GRADO Basica Secundaria  6° a 9° ----------*/ /* Total, horas por grupo - 35*/
/*---------- GRADO Media Tecnica  10° a 11° ----------*/ /* Total, horas por grupo - 37*/

INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Español", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Inglés", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Matemáticas", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Ciencias Naturales", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Ciencias sociales", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Religión", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Ética y valores", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Edu. Física", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Informática", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Proyecto Pedagógico Agroecológico", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Proyecto Pedagógico Productivo", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Ecología", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Artística", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Emprendimiento", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Quimica", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Fisica", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Ciencias Politicas", "Activa"); 
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Filosofia", "Activa");
INSERT INTO Asignatura (nombreAsignatura, estadoAsignatura) VALUES ("Convivencia", "Activa");

/*
	REGISTRO GRADOS SEDE y REGISTRO DOCENTES. se deben ejecutar despues de haber cargado el CSV
*/

/*--------------------------------------------------------REGISTRO GRADOS SEDE------------------------------------------------------------*/
/*
call registrarSedeGrado("LA AGUILILLA", 0); 
call registrarSedeGrado("LA AGUILILLA", 1); 
call registrarSedeGrado("LA AGUILILLA", 2); 
call registrarSedeGrado("LA AGUILILLA", 3); 
call registrarSedeGrado("LA AGUILILLA", 4); 
call registrarSedeGrado("LA AGUILILLA", 5); 
call registrarSedeGrado("LA AGUILILLA", 6); 
call registrarSedeGrado("LA AGUILILLA", 7); 
call registrarSedeGrado("LA AGUILILLA", 8); 
call registrarSedeGrado("LA AGUILILLA", 9); 
call registrarSedeGrado("LA AGUILILLA", 10); 
call registrarSedeGrado("LA AGUILILLA", 11); 

call registrarSedeGrado("ALTA RIVERA", 0); 
call registrarSedeGrado("ALTA RIVERA", 1); 
call registrarSedeGrado("ALTA RIVERA", 2); 
call registrarSedeGrado("ALTA RIVERA", 3); 
call registrarSedeGrado("ALTA RIVERA", 4); 
call registrarSedeGrado("ALTA RIVERA", 5);

call registrarSedeGrado("ALTO BRILLANTE", 0); 
call registrarSedeGrado("ALTO BRILLANTE", 1); 
call registrarSedeGrado("ALTO BRILLANTE", 2); 
call registrarSedeGrado("ALTO BRILLANTE", 3); 
call registrarSedeGrado("ALTO BRILLANTE", 4); 
call registrarSedeGrado("ALTO BRILLANTE", 5);

call registrarSedeGrado("ALTO RIECITO", 0); 
call registrarSedeGrado("ALTO RIECITO", 1); 
call registrarSedeGrado("ALTO RIECITO", 2); 
call registrarSedeGrado("ALTO RIECITO", 3); 
call registrarSedeGrado("ALTO RIECITO", 4); 
call registrarSedeGrado("ALTO RIECITO", 5);

call registrarSedeGrado("BAJO RIECITO", 0); 
call registrarSedeGrado("BAJO RIECITO", 1); 
call registrarSedeGrado("BAJO RIECITO", 2); 
call registrarSedeGrado("BAJO RIECITO", 3); 
call registrarSedeGrado("BAJO RIECITO", 4); 
call registrarSedeGrado("BAJO RIECITO", 5);

call registrarSedeGrado("EL BRILLANTE BAJO", 0); 
call registrarSedeGrado("EL BRILLANTE BAJO", 1); 
call registrarSedeGrado("EL BRILLANTE BAJO", 2); 
call registrarSedeGrado("EL BRILLANTE BAJO", 3); 
call registrarSedeGrado("EL BRILLANTE BAJO", 4); 
call registrarSedeGrado("EL BRILLANTE BAJO", 5);

call registrarSedeGrado("EL EDEN", 0); 
call registrarSedeGrado("EL EDEN", 1); 
call registrarSedeGrado("EL EDEN", 2); 
call registrarSedeGrado("EL EDEN", 3); 
call registrarSedeGrado("EL EDEN", 4); 
call registrarSedeGrado("EL EDEN", 5);

call registrarSedeGrado("EL RETORNO", 0); 
call registrarSedeGrado("EL RETORNO", 1); 
call registrarSedeGrado("EL RETORNO", 2); 
call registrarSedeGrado("EL RETORNO", 3); 
call registrarSedeGrado("EL RETORNO", 4); 
call registrarSedeGrado("EL RETORNO", 5);

call registrarSedeGrado("LA NUTRIA", 0); 
call registrarSedeGrado("LA NUTRIA", 1); 
call registrarSedeGrado("LA NUTRIA", 2); 
call registrarSedeGrado("LA NUTRIA", 3); 
call registrarSedeGrado("LA NUTRIA", 4); 
call registrarSedeGrado("LA NUTRIA", 5);

call registrarSedeGrado("LA RIVERA BAJA", 0); 
call registrarSedeGrado("LA RIVERA BAJA", 1); 
call registrarSedeGrado("LA RIVERA BAJA", 2); 
call registrarSedeGrado("LA RIVERA BAJA", 3); 
call registrarSedeGrado("LA RIVERA BAJA", 4); 
call registrarSedeGrado("LA RIVERA BAJA", 5);

call registrarSedeGrado("LIBANO ALTO", 0); 
call registrarSedeGrado("LIBANO ALTO", 1); 
call registrarSedeGrado("LIBANO ALTO", 2); 
call registrarSedeGrado("LIBANO ALTO", 3); 
call registrarSedeGrado("LIBANO ALTO", 4); 
call registrarSedeGrado("LIBANO ALTO", 5);

call registrarSedeGrado("LOS ANDES", 0); 
call registrarSedeGrado("LOS ANDES", 1); 
call registrarSedeGrado("LOS ANDES", 2); 
call registrarSedeGrado("LOS ANDES", 3); 
call registrarSedeGrado("LOS ANDES", 4); 
call registrarSedeGrado("LOS ANDES", 5);

call registrarSedeGrado("MONTE BELLO", 0); 
call registrarSedeGrado("MONTE BELLO", 1); 
call registrarSedeGrado("MONTE BELLO", 2); 
call registrarSedeGrado("MONTE BELLO", 3); 
call registrarSedeGrado("MONTE BELLO", 4); 
call registrarSedeGrado("MONTE BELLO", 5);

call registrarSedeGrado("MONTERREY", 0); 
call registrarSedeGrado("MONTERREY", 1); 
call registrarSedeGrado("MONTERREY", 2); 
call registrarSedeGrado("MONTERREY", 3); 
call registrarSedeGrado("MONTERREY", 4); 
call registrarSedeGrado("MONTERREY", 5);

call registrarSedeGrado("VILLANUEVA", 0); 
call registrarSedeGrado("VILLANUEVA", 1); 
call registrarSedeGrado("VILLANUEVA", 2); 
call registrarSedeGrado("VILLANUEVA", 3); 
call registrarSedeGrado("VILLANUEVA", 4); 
call registrarSedeGrado("VILLANUEVA", 5);

/*--------------------------------------------------------REGISTRO DOCENTES------------------------------------------------------------*/
/*
call registrarDocente(null, "LA AGUILILLA", "1116919521", "EL DONCELLO", "ANGELA", "JIMENA", "LOZANO", "CASTAÑO", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);
call registrarDocenteGrado2((select ObtenerIdDocente(1116919521)), 0);
call registrarDocenteGrado2((select ObtenerIdDocente(1116919521)), 1);

call registrarDocente(null, "LA AGUILILLA", "96360484", "PUERTO RICO", "RENAN", "EIGMER", "LOZANO", "OSPINA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);
call registrarDocenteGrado2((select ObtenerIdDocente(96360484)), 2);
call registrarDocenteGrado2((select ObtenerIdDocente(96360484)), 3);
                      
call registrarDocente(null, "LA AGUILILLA", "30519429", "PUERTO RICO", "CLAUDIA", "MILENA", "MONSALVE", null, null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);
call registrarDocenteGrado2((select ObtenerIdDocente(30519429)), 4);
call registrarDocenteGrado2((select ObtenerIdDocente(30519429)), 5); 

call registrarDocente(null, "LA AGUILILLA", "40730500", "DONCELLO", "DORA", "EMILSEN", "CASAS", "GOMEZ", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);
call registrarDocenteGrado2((select ObtenerIdDocente(40730500)), 6);
call registrarDocenteGrado2((select ObtenerIdDocente(40730500)), 7);  
call registrarDocenteGrado2((select ObtenerIdDocente(40730500)), 8);  
call registrarDocenteGrado2((select ObtenerIdDocente(40730500)), 9);  
call registrarDocenteGrado2((select ObtenerIdDocente(40730500)), 10);  
call registrarDocenteGrado2((select ObtenerIdDocente(40730500)), 11);  

call registrarDocente(null, "LA AGUILILLA", "1061756986", "POPAYAN", "ANGELA", "PAOLA", "GUERREO", "IDROBO", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);
call registrarDocenteGrado2((select ObtenerIdDocente(1061756986)), 6);
call registrarDocenteGrado2((select ObtenerIdDocente(1061756986)), 7);  
call registrarDocenteGrado2((select ObtenerIdDocente(1061756986)), 8);  
call registrarDocenteGrado2((select ObtenerIdDocente(1061756986)), 9);  
call registrarDocenteGrado2((select ObtenerIdDocente(1061756986)), 10);  
call registrarDocenteGrado2((select ObtenerIdDocente(1061756986)), 11); 
 
call registrarDocente(null, "LA AGUILILLA", "6801569", "FLORENCIA", "JHON", "FREDY", "TIQUE", "BASTO", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);
call registrarDocenteGrado2((select ObtenerIdDocente(6801569)), 6);
call registrarDocenteGrado2((select ObtenerIdDocente(6801569)), 7);  
call registrarDocenteGrado2((select ObtenerIdDocente(6801569)), 8);  
call registrarDocenteGrado2((select ObtenerIdDocente(6801569)), 9);  
call registrarDocenteGrado2((select ObtenerIdDocente(6801569)), 10);  
call registrarDocenteGrado2((select ObtenerIdDocente(6801569)), 11);
    
call registrarDocente(null, "LA AGUILILLA", "40777716", "FLORENCIA", "ISMA", "LEICER", "FRANCO", "CARDONA", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);
call registrarDocenteGrado2((select ObtenerIdDocente(40777716)), 6);
call registrarDocenteGrado2((select ObtenerIdDocente(40777716)), 7);  
call registrarDocenteGrado2((select ObtenerIdDocente(40777716)), 8);  
call registrarDocenteGrado2((select ObtenerIdDocente(40777716)), 9);  
call registrarDocenteGrado2((select ObtenerIdDocente(40777716)), 10);  
call registrarDocenteGrado2((select ObtenerIdDocente(40777716)), 11); 
      
call registrarDocente(null, "LA AGUILILLA", "1117547026", "FLORENCIA", "LAURA", "VANNESZA", "MARROQUIN", "GUASAQUILLO", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);
call registrarDocenteGrado2((select ObtenerIdDocente(1117547026)), 6);
call registrarDocenteGrado2((select ObtenerIdDocente(1117547026)), 7);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117547026)), 8);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117547026)), 9);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117547026)), 10);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117547026)), 11); 
        
call registrarDocente(null, "LA AGUILILLA", "96360868", "PUERTO RICO", "WILLIAM", null, "GARCIA", "MEDINA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);
call registrarDocenteGrado2((select ObtenerIdDocente(96360868)), 6);
call registrarDocenteGrado2((select ObtenerIdDocente(96360868)), 7);  
call registrarDocenteGrado2((select ObtenerIdDocente(96360868)), 8);  
call registrarDocenteGrado2((select ObtenerIdDocente(96360868)), 9);  
call registrarDocenteGrado2((select ObtenerIdDocente(96360868)), 10);  
call registrarDocenteGrado2((select ObtenerIdDocente(96360868)), 11);

call registrarDocente(null, "LA AGUILILLA", "38557758", "CALI", "ISID", "YOHANA", "PERDOMO", "ISANOA", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);
call registrarDocenteGrado2((select ObtenerIdDocente(38557758)), 6);
call registrarDocenteGrado2((select ObtenerIdDocente(38557758)), 7);  
call registrarDocenteGrado2((select ObtenerIdDocente(38557758)), 8);  
call registrarDocenteGrado2((select ObtenerIdDocente(38557758)), 9);  
call registrarDocenteGrado2((select ObtenerIdDocente(38557758)), 10);  

call registrarDocente(null, "LA AGUILILLA", "17690054", "FLORENCIA", "CRISTIAN", "FABIAN", "DUSSAN", "JARAMILLO", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(17690054)), 8);  
call registrarDocenteGrado2((select ObtenerIdDocente(17690054)), 9);  
call registrarDocenteGrado2((select ObtenerIdDocente(17690054)), 10);  
call registrarDocenteGrado2((select ObtenerIdDocente(17690054)), 11);

call registrarDocente(null, "ALTA AGUILILLA", "1117522074", "FLORENCIA", "ARNULFO", null, "OSORIO", "MANRIQUE", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117522074)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117522074)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117522074)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117522074)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1117522074)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1117522074)), 5);  	

call registrarDocente(null, "ALTA RIVERA", "82362603", "TADO", "YUBER", "ANTONIO", "MARTINEZ", "MOSQUERA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(82362603)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(82362603)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(82362603)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(82362603)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(82362603)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(82362603)), 5);  	

call registrarDocente(null, "ALTO BRILLANTE", "1115951826", "PUERTO RICO", "MARIA", "ALEJANDRA", "CABRERA", "HENAO", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(1115951826)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(1115951826)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(1115951826)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(1115951826)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1115951826)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1115951826)), 5);  	

call registrarDocente(null, "ALTO RIECITO", "30519921", "PUERTO RICO", "BLANA", "YUBELI", "PERDOMO", "SALAZAR", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(30519921)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(30519921)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(30519921)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(30519921)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(30519921)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(30519921)), 5);  	

call registrarDocente(null, "BAJO RIECITO", "1116203968", "CURILLO", "VICTOR", "ALFONSO", "GASCA", "MEDINA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(1116203968)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(1116203968)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(1116203968)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(1116203968)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1116203968)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1116203968)), 5);  	

call registrarDocente(null, "EL BRILLANTE BAJO", "6804417", "FLORENCIA", "CAMILO", "ANDRES", "CONDE", "FACUNDO", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(6804417)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(6804417)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(6804417)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(6804417)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(6804417)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(6804417)), 5);  	

call registrarDocente(null, "EL EDEN", "1117499417", "FLORENCIA", "DIANA", "MILENA", "RUIZ", "TOCORA", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117499417)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117499417)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117499417)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(1117499417)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1117499417)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1117499417)), 5);  	

call registrarDocente(null, "EL RETORNO", "17650041", "FLORENCIA", "SAMUEL", null, "SANCHEZ", "SANCHEZ", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(17650041)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(17650041)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(17650041)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(17650041)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(17650041)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(17650041)), 5);
  
call registrarDocente(null, "LA NUTRIA", "96359789", "PUERTO RICO", "HENRY", null, "ALVAREZ", "URIZA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(96359789)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(96359789)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(96359789)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(96359789)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(96359789)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(96359789)), 5);  	
  
call registrarDocente(null, "LA RIVERA BAJA", "1085174360", "GUAMAL", "JORGE", "ELIECER", "BANDERA", "MEJIA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(1085174360)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(1085174360)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(1085174360)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(1085174360)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1085174360)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1085174360)), 5);  	
  
call registrarDocente(null, "LIBANO ALTO", "30518761", "PUERTO RICO", "MARIA", "LINA", "ORTIZ", "TRUJILLO", null, null, null, null, null, null,
					  null, null, null, null, null, "Femenino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(30518761)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(30518761)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(30518761)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(30518761)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(30518761)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(30518761)), 5);  	
  
call registrarDocente(null, "LOS ANDES", "12192408", "GARZON", "ADOLFO", null, "RIVERA", "CABRERA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(12192408)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(12192408)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(12192408)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(12192408)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(12192408)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(12192408)), 5);	
  
call registrarDocente(null, "MONTE BELLO", "1024579502", "BOGOTA D.C.", "MATEO", null, "SALAZAR", "SERNA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(1024579502)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(1024579502)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(1024579502)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(1024579502)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1024579502)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(1024579502)), 5);  	
  
call registrarDocente(null, "MONTERREY", "4831345", "ISTMINA CHOCO", "LUIS", "GILBERTO", "SANCHEZ", "PEREA", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(4831345)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(4831345)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(4831345)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(4831345)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(4831345)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(4831345)), 5);  	
  
call registrarDocente(null, "VILLANUEVA", "96351351", "EL DONCELLO", "VICENTE", null, "CANO", "CUELLAR", null, null, null, null, null, null,
					  null, null, null, null, null, "Masculino", null, null);  
call registrarDocenteGrado2((select ObtenerIdDocente(96351351)), 0);  
call registrarDocenteGrado2((select ObtenerIdDocente(96351351)), 1);  
call registrarDocenteGrado2((select ObtenerIdDocente(96351351)), 2);  
call registrarDocenteGrado2((select ObtenerIdDocente(96351351)), 3);  	
call registrarDocenteGrado2((select ObtenerIdDocente(96351351)), 4);  	
call registrarDocenteGrado2((select ObtenerIdDocente(96351351)), 5);  	
*/


/* MODIFICAR SI ES NECESARIO
UPDATE GradoGrupo
SET fkidGrado = 207000
WHERE idGradoGrupo = 208100;
*/




				