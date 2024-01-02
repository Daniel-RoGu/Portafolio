USE `adopciones`;

/*-------------Tipo documento----------*/
call registrarTpDocumento("TI");
call registrarTpDocumento("CC");

call eliminarTpDocumento("TI");

call mostrarTpDocumento();

/*-----------------Raza--------------*/
call registrarRaza("Pitbull");
call registrarRaza("Pincher");

call eliminarRaza("Pincher");

call mostrarRaza();

/*--------------Tipo mascota-----------*/
call registrarTpMascota("Perro");
call registrarTpMascota("Gato");
call registrarTpMascota("Pollo");

call eliminarTpMascota("Gato");

call mostrarTpMascota();

/*-----------------Vacuna--------------*/
call registrarVacuna("Ch-234");
call registrarVacuna("Ch-235");
call registrarVacuna("Ch-236");

call eliminarVacuna("Ch-235");

call mostrarVacuna();

call editarVacuna("Ch-234", "Ch-234", "Habilitada");

/*-----------------Permiso--------------*/
call registrarPermiso("Registrar_Permisos");
call registrarPermiso("Registrar_Roles");
call registrarPermiso("Eliminar_Roles");

call eliminarPermiso("Eliminar_Roles");

call mostrarPermiso();

call editarPermiso("Eliminar_Roles", "Registrar_TipoDocumento", "Habilitado");

/*-----------------Roles--------------*/
call registrarRol("Administrador");
call registrarRol("Empleado");
call registrarRol("Asistente");

call eliminarRol("Asistente");

call mostrarRoles();

call editarRoles("Empleado", "Asistente", "Habilitado");

/*-----------------PermisosRoles--------------*/
call registrarPermisoRol("Registrar_Permisos", "Asistente", "Escritorio", "/GestionPermisos");
call registrarPermisoRol("Registrar_Roles", "Administrador", "Escritorio", "/GestionPermisos");
call registrarPermisoRol("Registrar_TipoDocumento", "Asistente", "Escritorio", "/GestionPermisos");

call eliminarPermisoRol("Asistente", "Registrar_TipoDocumento");

call mostrarPermisosRoles();

call editarPermisosRoles("Asistente", "Registrar_Permisos", "Administrador", "Escritorio", "/GestionPermisos");

/*--------------------Persona-----------------*/
call registrarPersona(123456, "Jhulian con J", "Con J", 28, "CC", "310254964", "En algun lugar de tu corazon", "hey@comovas.com");
call registrarPersona(456123, "Hugo con H", "Fufo", 30, "CC", "310254964", "En algun lugar de tu corazon", "el@diceqNo.com");

call eliminarPersona(123456, "310254964", "hey@comovas.com");

call mostrarPersona();

call editarPersona(456123, "Hugis", "Fufis", 28, "310254964", "En algun lugar de tu corazon", "el@diceqNo.com");

/*--------------------Usuario-----------------*/
call registrarUsuario(423456, "Jhulian", "no Julian", 28, "CC", "310254964", "En algun lugar de tu corazon", "hey@comovas.com", "HDJhu", "algo", "Administrador");
call registrarUsuario(823456, "Jhu", "tampoco Julian", 30, "CC", "254310964", "En algun lugar de tu corazon", "hey@comovasTu.com", "Hugis3D", "algoMas", "Administrador");

call eliminarUsuario("HDJhu");

call mostrarUsuario();

call editarUsuario("H3DJhu", "H3DJhus", "ElBlanquito1", "Hugis", "Fufis", 28, "310254964", "En algun lugar de tu corazon", "el@diceqNo.com");

/*--------------------Mascota-----------------*/
call registrarMascota("Firulais segundus", 4, 16, "Macho", "Es medio rarito", "Pincher", "Perro", "H3DJhu");
call registrarMascota("Firulais2.0", 8, 32, "Macho", "Es 3/4 rarito", "Pincher", "Perro", "H3DJhu");
call registrarMascotaVacuna("Firulais segundus", "Ch-235", "2023/12/02");
call mostrarMascota();
call mostrarVacunasMascota("Firulais segundus");
call editarMascota("Firulais2.0", 7, 31, "Es 2,9/4 rarito", "Disponible");

/*--------------------Adopcion-----------------*/
call registrarAdopcion("2023/12/03", "El", "EsAlgo", "132452", "123", "CC", "En espera", "Firulais2.0");
call registrarAdopcion("2023/12/04", "ElBabio", "EsAlgoM", "452132", "124", "CC", "En espera", "Firulais segundus");
call registrarAdopcion("2023/12/04", "Huyo", "EsM", "902132", "1874", "CC", "En espera", "Hugo");

call editarAdopcion("2023/12/04", "Aceptado", "Firulais2.0");
call editarAdopcion("2023/12/05", "Aceptado", "Firulais segundus");
call editarAdopcion("2023/12/05", "Aceptado", "Hugo");
call mostrarAdopciones();
call mostrarAdopcion("Firulais2.0");