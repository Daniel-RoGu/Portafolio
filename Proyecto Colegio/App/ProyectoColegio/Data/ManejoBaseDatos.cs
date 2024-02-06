using MySql.Data.MySqlClient;
using System;
using System.Data;
using System.Collections.Generic;

namespace ProyectoColegio.Data
{
    public static class ManejoBaseDatos
    {
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

    }

}
