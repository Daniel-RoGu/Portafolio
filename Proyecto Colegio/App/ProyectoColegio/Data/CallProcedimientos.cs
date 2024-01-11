using MySql.Data.MySqlClient;
using Microsoft.AspNetCore.Mvc;
using ProyectoColegio.Data;
using ProyectoColegio.Models;

namespace ProyectoColegio.Data
{
    public class CallProcedimientos
    {
        private readonly Contexto _contexto;

        public CallProcedimientos(Contexto contexto)
        {
            _contexto = contexto;
        }

        public void TratamientoListasDatos(object[] datos, string nombreProcedimiento, List<string> parametrosProcedimiento)
        {
            try
            {

                foreach (var dato in datos)
                {
                    using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
                    {
                        conexion.Open();
                        MySqlCommand Command = new MySqlCommand(nombreProcedimiento, conexion);
                        Command.CommandType = System.Data.CommandType.StoredProcedure;
                        foreach (var item in parametrosProcedimiento)
                        {
                            Command.Parameters.AddWithValue(item, dato);
                            Command.ExecuteNonQuery();
                        }                        
                    }
                    Console.WriteLine(dato);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }

        }

    }

}
