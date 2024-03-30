﻿using Microsoft.AspNetCore.Mvc;
using ProyectoColegio.Models;

namespace ProyectoColegio.Data
{
    public class ConsultasGlobales
    {

        public List<Usuario> mostrarInfoSimat(string Conexion, string nomSede, string nomGrupo, string nomGrado)
        {           
            int parametrosEstudiantesGrupo = 0;
            //List<object> resultados = new List<object>();

            Dictionary<string, Type> atributosEstudiante = new Dictionary<string, Type>
            {
                { "documento", typeof(long) },
                { "nomUsuario", typeof(string) },
                { "nom2Usuario", typeof(string) },
                { "apellidoUsuario", typeof(string) },
                { "apellido2Usuario", typeof(string) },
                { "edad", typeof(int) },
                { "telCelular", typeof(string) },
                { "telFijo", typeof(string) },
                { "correoUss", typeof(string) },
                { "direccionUss", typeof(string)  },
                { "barrioUss", typeof(string)  },
                { "fechaNacimientoUss", typeof(string) },
                { "estadoUss", typeof(string) },
                { "tipoSangre", typeof(string)  },
                { "tipoDocumento", typeof(string)  },
                { "nombreDiscapacidad", typeof(string)  },
                { "nombreSisben", typeof(string)  },
                { "nombreGenero", typeof(string)  },
                { "nombreEps", typeof(string)  },
                { "nombreEstrato", typeof(string)  },
                { "Grado", typeof(string)  },
                { "Grupo", typeof(string)  },
            };

            parametrosEstudiantesGrupo = atributosEstudiante.Count();
            var resultados = new List<object>();

            if (string.IsNullOrEmpty(nomSede))
            {
                resultados = ManejoBaseDatos.ConsultarProcedimientoDinamico("mostrarEstudiantes2", atributosEstudiante, Conexion);
            }
            else if (string.IsNullOrEmpty(nomGrado))
            {                 
                Dictionary<string, object> parametros = new Dictionary<string, object>
                {
                    { "nomSede", nomSede },
                };

                resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("obtenerEstudiantesSede2", parametros, parametrosEstudiantesGrupo, Conexion);                              
            }
            else if (string.IsNullOrEmpty(nomGrupo))
            {
                Dictionary<string, object> parametros = new Dictionary<string, object>
                {
                    { "nomSede", nomSede },
                    { "nomGrado", nomGrado },
                };

                resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("obtenerEstudianteSedeGrado", parametros, parametrosEstudiantesGrupo, Conexion); ;                              
            }
            else
            {
                Dictionary<string, object> parametros = new Dictionary<string, object>
                {
                    { "nomSede", nomSede },
                    { "nomGrupo", nomGrupo },
                };

                resultados = ManejoBaseDatos.EjecutarProcedimientoConMultiParametroYConsulta("obtenerEstudiantesSedeGrupo2", parametros, parametrosEstudiantesGrupo, Conexion);
            }

            return OrganizarResultados(resultados);
        }

        public List<Usuario> OrganizarResultados(List<Object> datos)
        {
            List<Usuario> usuarios = new List<Usuario>();

            //organiza los resultados
            foreach (List<Object> item in datos)
            {
                Usuario usuario = new Usuario();
                usuario.Identificacion = (Convert.ToInt64(item[0]));
                usuario.NombreUsuario = Convert.ToString(item[1]);
                usuario.SegundoNombreUsuario = Convert.ToString(item[2]);
                usuario.ApellidoUsuario = Convert.ToString(item[3]);
                usuario.SegundoApellidoUsuario = Convert.ToString(item[4]);
                usuario.Edad = Convert.ToInt16(item[5]);
                usuario.TelefonoCelular = Convert.ToString(item[6]);
                usuario.TelefonoFijo = Convert.ToString(item[7]);
                usuario.Correo = Convert.ToString(item[8]);
                usuario.Direccion = Convert.ToString(item[9]);
                usuario.Barrio = Convert.ToString(item[10]);
                usuario.FechaNacimiento = Convert.ToString(item[11]);
                usuario.EstadoUsuario = Convert.ToString(item[12]);
                usuario.TipoSangre = Convert.ToString(item[13]);
                usuario.TipoDocumento = Convert.ToString(item[14]);
                usuario.Discapacidad = Convert.ToString(item[15]);
                usuario.Sisben = Convert.ToString(item[16]);
                usuario.Genero = Convert.ToString(item[17]);
                usuario.EPS = Convert.ToString(item[18]);
                usuario.Estrato = Convert.ToString(item[19]);
                usuario.Grado = Convert.ToString(item[20]);
                usuario.Grupo = Convert.ToString(item[21]);

                usuarios.Add(usuario);
            }

            return usuarios;

        }

        public List<Object> mostrarCsv(string Conexion, string nomSede, string nomGrupo, string nomGrado)
        {
            List<Estudiante> Estudiantes = new List<Estudiante>();
            List<Object> Datos = new List<Object>();

            try
            {
                foreach (Usuario item in mostrarInfoSimat(Conexion, nomSede,nomGrupo, nomGrado))
                {
                    List<String> Dato = new List<String>();

                    Dato.Add(Convert.ToString(item.Identificacion));
                    Dato.Add(item.NombreUsuario);
                    Dato.Add(item.SegundoNombreUsuario);
                    Dato.Add(item.ApellidoUsuario);
                    Dato.Add(item.SegundoApellidoUsuario);
                    Dato.Add(Convert.ToString(item.Edad));
                    Dato.Add(item.TelefonoCelular);
                    Dato.Add(item.TelefonoFijo);
                    Dato.Add(item.Correo);
                    Dato.Add(item.Direccion);
                    Dato.Add(item.Barrio);
                    Dato.Add(item.FechaNacimiento);
                    Dato.Add(item.TipoSangre);
                    Dato.Add(item.TipoDocumento);
                    Dato.Add(item.Discapacidad);
                    Dato.Add(item.Sisben);
                    Dato.Add(item.Genero);
                    Dato.Add(item.EPS);
                    Dato.Add(item.Estrato);
                    foreach (Object obj in ObtenerCodigoEstudiante((item.Identificacion), Conexion))
                    {
                        Dato.Add(Convert.ToString(obj));
                    }
                    //foreach (var item1 in buscarEstudiante(Convert.ToString(item.Identificacion), Conexion))
                    //{
                    //    Dato.Add(item1);
                    //}
                    Dato.Add(item.Grado);
                    Dato.Add(item.Grupo);
                    
                    Datos.Add(Dato);

                }

            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.Message);
            }
            Console.WriteLine(Datos);
            return Datos;
        }

        public List<Object> ObtenerCodigoEstudiante(long identificacion, string Conexion)
        {
            Dictionary<string, Type> atributos = new Dictionary<string, Type>
            {
                // Definir aqui atributos y tipos esperados
                { "CodigoEstudiante", typeof(long) },
                // ...
            };

            //inecesario la creaccion del diccionario, pero es un ejemplo optimo para identificar el porque del valor
            int numeroAtributos = atributos.Count;

            // Definir los parámetros necesarios para el procedimiento almacenado
            string nombreProcedimiento = "obtenerCodigoEstudiantes";
            string nombreParametro = "identificacionUs";

            // Llamar al método
            List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConParametroYConsulta(nombreProcedimiento, nombreParametro, identificacion, numeroAtributos, Conexion);
            
            return resultados;
        }

        public string organizarValorGradoSimat(string grado)
        {
            string retorno = "0";

            if (!string.IsNullOrEmpty(grado))
            {
                if (grado != "00" || grado != "000" || grado != "0000")
                {
                    retorno = grado.TrimStart('0');
                    return retorno;
                }
                else
                {
                    return retorno;
                }
            }
            else
            {
                return retorno = "";
            }

            
        }


        public string organizarValorGrupoSimat(string grupo)
        {
            string retorno = "0";

            if (!string.IsNullOrEmpty(grupo))
            {
                return retorno = grupo.TrimStart('0');
            }
            else
            {
                return retorno;
            }

        }

        //public List<string> buscarEstudiante(string identificacion, string Conexion)
        //{
        //    List<string> GradoGrupoEst = new List<string>();    

        //    Dictionary<string, Type> atributos = new Dictionary<string, Type>
        //    {
        //        // Definir aqui atributos y tipos esperados
        //        { "Grado", typeof(string) },
        //        { "Grupo", typeof(string) },
        //    };

        //    //inecesario la creaccion del diccionario, pero es un ejemplo optimo para identificar el porque del valor
        //    int numeroAtributos = atributos.Count;

        //    // Definir los parámetros necesarios para el procedimiento almacenado
        //    string nombreProcedimiento = "obtenerGradoYGrupoEstudiante";
        //    string nombreParametro = "identificacionEst";

        //    // Llamar al método
        //    List<Object> resultados = ManejoBaseDatos.EjecutarProcedimientoConParametroYConsulta(nombreProcedimiento, nombreParametro, identificacion, numeroAtributos, Conexion);

        //    GradoGrupoEst.Add(Convert.ToString(resultados[0]));
        //    GradoGrupoEst.Add(Convert.ToString(resultados[1]));

        //    return GradoGrupoEst;

        //}

    }
}