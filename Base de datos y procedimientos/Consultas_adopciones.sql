
/*-------------------------------------------------------Consultas------------------------------------------------------------------*/
use adopciones;
call insertar_tp_mascota("Perro","Activo");
call insertar_tp_mascota("Gato","Activo");

call insertar_tp_documento("Cédula de Ciudadania","Activo");
call insertar_tp_documento("Tarjeta identidad","Activo");

call insertar_rol("Usuario","Activo");
call insertar_rol("Administrador","Activo");

call insertar_raza("Pitbull","Activo");
call insertar_raza("Pincher","Activo");
call insertar_raza("Persa","Activo");

call insertar_vacunas("Rabia", "Activo");
call insertar_vacunas("Sarna", "Activo");

call insertar_persona(1061804965,"Esteban","Muñoz",26,3108009098,"Florencia","esteban@gmail.com",200,"stebanm_1","12345");

call insertar_adopcion(701);
call eliminar_adopcion(1007);


select (date(now()));

/*-------------------------------------REGISTROS IMPORTANTES--------------------------------------*/
/*------------------------------------------------------------------------------------------------*/


/*-------------------------------------------Permisos_carpetasRaiz-------------------------------------------*/


call insertar_permiso("../Administrador");
call insertar_permiso("../Adopcion");
call insertar_permiso("../Login");
call insertar_permiso("../Mascota");
call insertar_permiso("../Mascota_Vacunas");
call insertar_permiso("../Permisos");
call insertar_permiso("../Permisos_Roles");
call insertar_permiso("../Persona");
call insertar_permiso("../Principal");
call insertar_permiso("../Raza");
call insertar_permiso("../Roles");
call insertar_permiso("../Tipo_Mascota");
call insertar_permiso("../TipoDocumento");
call insertar_permiso("../Usuario");
call insertar_permiso("../Vacunas");

/*--------------------------------------Permisos Administrador------------------------------------*/

call insertar_permisos_roles(906, 101, "/Principal");
call insertar_permisos_roles(907, 101, "/Mostrar");
call insertar_permisos_roles(910, 101, "/Principal");
call insertar_permisos_roles(910, 101, "/Mostrar");
call insertar_permisos_roles(910, 101, "/Registrar");
call insertar_permisos_roles(912, 101, "/Mostrar");
call insertar_permisos_roles(912, 101, "/Registrar");
call insertar_permisos_roles(917, 101, "/Mostrar");
call insertar_permisos_roles(917, 101, "/Registrar");
call insertar_permisos_roles(919, 101, "/Mostrar");
call insertar_permisos_roles(919, 101, "/Registrar");
call insertar_permisos_roles(914, 101, "/Mostrar");
call insertar_permisos_roles(916, 101, "/Mostrar");
call insertar_permisos_roles(916, 101, "/Registrar");
call insertar_permisos_roles(918, 101, "/Mostrar");
call insertar_permisos_roles(918, 101, "/Registrar");
call insertar_permisos_roles(921, 101, "/Mostrar");
call insertar_permisos_roles(921, 101, "/Registrar");

/*--------------------------------------Permisos Usuario------------------------------------*/

call insertar_permisos_roles(907, 100, "/Mostrar");
call insertar_permisos_roles(907, 100, "/MostrarSolicitante");
call insertar_permisos_roles(910, 100, "/Principal");
call insertar_permisos_roles(910, 100, "/Index");
call insertar_permisos_roles(910, 100, "/Registrar");
call insertar_permisos_roles(914, 100, "/Obtener");