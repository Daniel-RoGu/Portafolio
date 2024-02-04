using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProyectoColegio.Data;
using ProyectoColegio.Models;

namespace ProyectoColegio.Controllers
{
    public class DiscapacidadController : Controller
    {
        private readonly Contexto _contexto;
        Discapacidad discapacidad = new Discapacidad();

        public DiscapacidadController(Contexto contexto)
        {
            _contexto = contexto;
        }

        public List<string> LeerDiscapacidad()
        {
            LecturaJson lecturaJson = new LecturaJson();

            //llama el metodo para la lectura del json
            discapacidad.Discapacidades = (lecturaJson.Resultado("Archivos_Json/Discapacidad.json"));

            //return datos;
            return (discapacidad.Discapacidades);
        }


        public IActionResult RegistrarDiscapacidad()
        {
            return View();
        }


        [HttpPost]
        public IActionResult RegistrarDiscapacidad(Discapacidad discapacidad)
        {

            try
            {

                foreach (string dato in LeerDiscapacidad())
                {
                    using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
                    {
                        conexion.Open();
                        MySqlCommand Command = new MySqlCommand("registrarDiscapacidad", conexion);
                        Command.CommandType = System.Data.CommandType.StoredProcedure;
                        Command.Parameters.AddWithValue("nomDiscapacidad", dato);
                        Command.ExecuteNonQuery();
                    }
                    Console.WriteLine(dato);
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine($"Error al ejecutar el script: {ex.Message}");
            }


            return RedirectToAction("Index", "Home");
        }
    }
}
