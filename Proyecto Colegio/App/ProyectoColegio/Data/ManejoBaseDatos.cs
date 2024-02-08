using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Collections.Generic;

namespace ProyectoColegio.Data
{
    public static class ManejoBaseDatos
    {
        //Permite llamar procedimientos que reciben un solo dato como parametro
        public static void EjecutarProcedimientoAlmacenado(string nombreProcedimiento, string parametroNombre, object parametroValor, string cadenaConexion)
        {
            try
            {
                using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
                {
                    conexion.Open();
                    using (MySqlCommand comando = new MySqlCommand(nombreProcedimiento, conexion))
                    {
                        comando.CommandType = CommandType.StoredProcedure;

                        if (parametroNombre != null)
                        {
                            comando.Parameters.AddWithValue(parametroNombre, parametroValor);
                        }

                        comando.ExecuteNonQuery();
                    }
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el procedimiento almacenado: {ex.Message}");
            }
        }

        //Permite llamar procedimientos que reciben multiples datos como parametro
        public static void EjecutarProcedimientoMultiParametro(string nombreProcedimiento, Dictionary<string, object> parametros, string cadenaConexion)
        {
            try
            {
                using (MySqlConnection conexion = new MySqlConnection(cadenaConexion))
                {
                    conexion.Open();
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
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el procedimiento almacenado: {ex.Message}");
            }
        }

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

}
