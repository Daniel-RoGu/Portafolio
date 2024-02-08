using MySql.Data.MySqlClient;
using Microsoft.AspNetCore.Mvc;
using ProyectoColegio.Data;
using ProyectoColegio.Models;

namespace ProyectoColegio.Data
{
    public class ManejoProcedimientos
    {
        private readonly Contexto _contexto;
        private List<Object> Datos = new List<object>();
        private List<Object> ListaDatos = new List<object>();
        private List<String> parametros = new List<String>();
       
        public ManejoProcedimientos(Contexto contexto)
        {
            _contexto = contexto;
        }

        public ManejoProcedimientos()
        {
        }
        
        //Metos para gestion de parametros en la clase
        public String Parametro(String parametro)
        {
            return parametro;
        }

        public List<String> ListaParametros(String parametro) { 
            parametros.Add(parametro);
            return parametros;
        }

        public void LimpiarListaParametros()
        {
            parametros.Clear();
        }

        //Metodos para el manejo de atributos de objeto en la clase
        public void LLenarObjetoDatos(Object objeto)
        {
            Datos.Add(objeto);
        }

        public Object RetornarDato()
        {
            return Datos;
        }

        public void LimpiarObjetoDatos()
        {
            Datos.Clear();
        }

        //Metodo para el manejo de una lista de objetos en la clase
        public void LlenarListaDatos(List<Object> listaObjetos)
        {
            ListaDatos.Add(listaObjetos);
        }

        public List<Object> RetornarListaDatos()
        {
            return ListaDatos;
        }

        public void LimpiarListaDatos()
        {
            ListaDatos.Clear();
        }

        //Metodo para el flujo de datos desde la clase hasta la base de datos
        public void TratamientoListasDatos(List<Object> datos, string nombreProcedimiento, List<string> parametrosProcedimiento)
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
