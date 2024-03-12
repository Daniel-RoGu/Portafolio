using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Collections.Generic;
using System.Dynamic;

namespace ProyectoColegio.Data
{
    public static class ManejoBaseDatos
    {

        //Permite llamar procedimientos que reciben un solo dato como parametro, registra en bd
        public static void EjecutarProcedimientoAlmacenado(string nombreProcedimiento, string parametroNombre, object parametroValor, string cadenaConexion)
        {
            int tamanoPool = 100;
            GestorConexion gestorConexion = new GestorConexion(cadenaConexion, tamanoPool);

            try
            {
                using (MySqlConnection conexion = gestorConexion.ObtenerConexion())
                {
                    //conexion.Open();
                    using (MySqlCommand comando = new MySqlCommand(nombreProcedimiento, conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;

                        if (parametroNombre != null)
                        {
                            comando.Parameters.AddWithValue(parametroNombre, parametroValor);
                        }

                        comando.ExecuteNonQuery();
                    }
                    //conexion.Close();

                    // Cerrar conexiones inactivas después de cierto tiempo
                    TimeSpan tiempoMaximoInactividad = TimeSpan.FromSeconds(1);
                    gestorConexion.CerrarConexionesInactivas(tiempoMaximoInactividad);

                    Console.WriteLine("Conexiones cerradas después de cierto tiempo de inactividad");
                }
                
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el procedimiento almacenado: {ex.Message}");
            }
        }

        
        //Permite llamar procedimientos que reciben multiples datos como parametro, envia informacion a base de datos
        public static void EjecutarProcedimientoMultiParametro(string nombreProcedimiento, Dictionary<string, object> parametros, string cadenaConexion)
        {
            int tamanoPool = 100;
            GestorConexion gestorConexion = new GestorConexion(cadenaConexion, tamanoPool);

            try
            {
                using (MySqlConnection conexion = gestorConexion.ObtenerConexion())
                {
                    //ReiniciarConexion(cadenaConexion);
                    //conexion.Open();

                    using (MySqlCommand comando = new MySqlCommand(nombreProcedimiento, conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;

                        if (parametros != null)
                        {
                            foreach (var parametro in parametros)
                            {
                                comando.Parameters.AddWithValue(parametro.Key, parametro.Value);
                            }
                        }

                        comando.ExecuteNonQuery();
                    }
                    //conexion.Close();

                    TimeSpan tiempoMaximoInactividad = TimeSpan.FromSeconds(1);
                    gestorConexion.CerrarConexionesInactivas(tiempoMaximoInactividad);

                    Console.WriteLine("Conexiones cerradas después de cierto tiempo de inactividad");
                }
                
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el procedimiento almacenado: {ex.Message}");
            }
        }

        
        //Permite enviar una consulta a base de datos que retorna multiples resultados, usando parametros vacios
        public static List<Object> ConsultarProcedimientoDinamico(string nombreProcedimiento, Dictionary<string, Type> atributos, string cadenaConexion)
        {
            //List<T> listaObjetos = new List<T>();
            List<Object> listaObjetos = new List<Object>();
            List<Object> listaDatosRetornoUnico = new List<object>();

            int tamanoPool = 100;
            GestorConexion gestorConexion = new GestorConexion(cadenaConexion, tamanoPool);


            try
            {
                using (MySqlConnection conexion = gestorConexion.ObtenerConexion())
                {
                    //conexion.Open();
                    MySqlCommand comando = new MySqlCommand(nombreProcedimiento, conexion);
                    comando.CommandType = CommandType.StoredProcedure;

                    using (MySqlDataReader lector = comando.ExecuteReader())
                    {
                        while (lector.Read())
                        {
                            //T objeto = new T();

                            List<Object> listaDatos = new List<object>();
                            

                            foreach (var atributo in atributos)
                            {
                                string nombreColumna = atributo.Key;
                                Dato dato = new Dato();
                                GestionDato gestionDato = new GestionDato();

                                // Verificar si la columna existe en el resultado del lector
                                if (lector.HasColumn(nombreColumna))
                                {
                                    object valor = lector[nombreColumna];

                                    // Asignar directamente el valor al atributo correspondiente del objeto
                                    //typeof(T).GetProperty(nombreColumna)?.SetValue(objeto, valor != DBNull.Value ? Convert.ChangeType(valor, atributo.Value) : "Sin_Registro");
                                    dato.Nombre = nombreColumna;
                                    dato.Valor = valor != DBNull.Value ? Convert.ChangeType(valor, atributo.Value) : "Sin_Registro";
                                }
                              
                                listaDatos.Add(dato.Valor);
                                listaDatosRetornoUnico.AddRange(listaDatos);
                                
                            }

                            listaObjetos.Add(listaDatos);
                        }
                    }
                    //conexion.Close();

                    // Cerrar conexiones inactivas después de cierto tiempo
                    TimeSpan tiempoMaximoInactividad = TimeSpan.FromSeconds(1);
                    gestorConexion.CerrarConexionesInactivas(tiempoMaximoInactividad);

                    Console.WriteLine("Conexiones cerradas después de cierto tiempo de inactividad");

                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el procedimiento almacenado: {ex.Message}");
            }

            if (atributos.Count == 1)
            {
                return listaDatosRetornoUnico;
            }

            return listaObjetos;
        }

       
        public static List<Object> EjecutarProcedimientoConParametroYConsulta(string nombreProcedimiento, string nombreParametro, object valorParametro, int numeroAtributos, string cadenaConexion)
        {
            List<Object> listaObjetos = new List<Object>();

            int tamanoPool = 100;
            GestorConexion gestorConexion = new GestorConexion(cadenaConexion, tamanoPool);

            try
            {
                //MySqlConnection conexion = new MySqlConnection(cadenaConexion);
                MySqlConnection conexion = gestorConexion.ObtenerConexion();
                //conexion.Open();
                //String sql = "call obtenerCodigoEstudiantes(@identificacionUs)";
                string sqlConsulta = $"CALL bdColegio.{nombreProcedimiento}(@{nombreParametro})";
                MySqlCommand conexionCommand = new MySqlCommand(sqlConsulta, conexion);
                conexionCommand.Parameters.AddWithValue($"@{nombreParametro}", valorParametro);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    for (int i = 0; i < numeroAtributos; i++)
                    {
                        listaObjetos.Add(mySqlDataReader.GetString(i));
                    }                  
                }
                //conexion.Close();                
                // Cerrar conexiones inactivas después de cierto tiempo
                TimeSpan tiempoMaximoInactividad = TimeSpan.FromSeconds(1);
                gestorConexion.CerrarConexionesInactivas(tiempoMaximoInactividad);

                Console.WriteLine("Conexiones cerradas después de cierto tiempo de inactividad");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el procedimiento almacenado: {ex.Message}");
            }

            return listaObjetos;
        }
               
        
        public static List<Object> EjecutarProcedimientoConMultiParametroYConsulta(string nombreProcedimiento, Dictionary<string, object> parametros, int numeroAtributos, string cadenaConexion)
        {
            List<Object> listaObjetos = new List<Object>();
            List<Object> listaIndividual = new List<Object>();
            int tamanoPool = 100;
            GestorConexion gestorConexion = new GestorConexion(cadenaConexion, tamanoPool);

            try
            {
                //MySqlConnection conexion = new MySqlConnection(cadenaConexion);
                MySqlConnection conexion = gestorConexion.ObtenerConexion();
                //conexion.Open();

                // Construye la consulta con los parámetros
                string sqlConsulta = $"CALL bdColegio.{nombreProcedimiento}(";

                foreach (var parametro in parametros)
                {
                    sqlConsulta += $"@{parametro.Key}, ";
                }

                sqlConsulta = sqlConsulta.TrimEnd(' ', ',') + ")";

                MySqlCommand conexionCommand = new MySqlCommand(sqlConsulta, conexion);

                // Agrega los parámetros al comando
                foreach (var parametro in parametros)
                {
                    conexionCommand.Parameters.AddWithValue($"@{parametro.Key}", parametro.Value);
                }

                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {

                    List<Object> listaDatos = new List<Object>();
                        
                    for (int i = 0; i < numeroAtributos; i++)
                    {
                        listaDatos.Add(mySqlDataReader.GetString(i));
                        listaIndividual.Add(mySqlDataReader.GetString(i));
                    }

                    
                    listaObjetos.Add(listaDatos);

                    //if (numeroAtributos == 1)
                    //{
                    //    //return listaObjetos = listaDatos;
                        
                    //}
                }

                if (numeroAtributos == 1)
                {
                    listaObjetos = listaIndividual;

                }
                //conexion.Close();
                TimeSpan tiempoMaximoInactividad = TimeSpan.FromSeconds(1);
                gestorConexion.CerrarConexionesInactivas(tiempoMaximoInactividad);

                Console.WriteLine("Conexiones cerradas después de cierto tiempo de inactividad");
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el procedimiento almacenado: {ex.Message}");
            }
            return listaObjetos;
        }

        //public static void ReiniciarConexion(string cadenaConexion)
        //{
        //    try
        //    {
        //        using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
        //        {
        //            conexion.Close();
        //            conexion.Open();
        //            conexion.Close();

        //        }
        //        Console.WriteLine("Conexiones reiniciadas exitosamente.");
        //    }
        //    catch (Exception ex)
        //    {
        //        Console.WriteLine($"Error al reiniciar la conexión: {ex.Message}");
        //    }
        //}


        public static int CalcularEdad(string fechaNacimiento)
        {
            DateTime fechaNac;

            // Definir varios formatos de fecha posibles
            string[] formatosFecha = { "dd/MM/yyyy", "d/MM/yyyy", "dd/M/yyyy", "d/M/yyyy" };

            // Intentar convertir la fecha utilizando los formatos especificados
            if (DateTime.TryParseExact(fechaNacimiento, formatosFecha, null, System.Globalization.DateTimeStyles.None, out fechaNac))
            {
                DateTime fechaActual = DateTime.Now;
                int edad = fechaActual.Year - fechaNac.Year;

                // Verificar si aún no ha cumplido años en el año actual
                if (fechaNac > fechaActual.AddYears(-edad))
                {
                    edad--;
                }

                return edad;
            }
            else
            {
                // Manejar el caso en que la fecha de nacimiento no sea válida
                throw new ArgumentException("Formato de fecha de nacimiento no válido. Debe ser 'dd/MM/yyyy' o 'd/MM/yyyy'.");
            }
        }

    }


    public class Dato
    {
        public string Nombre { get; set; }
        public object Valor { get; set; }
    }

    public class GestionDato
    {
        
         public object ConvertirDatoADynamic(Dato dato)
         {
            dynamic dynamicObject = new ExpandoObject();
            var dictionary = (IDictionary<string, object>)dynamicObject;

            dictionary[dato.Nombre] = dato.Valor;

            return dynamicObject;
         }

    }

}
