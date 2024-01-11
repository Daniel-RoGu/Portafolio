using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProyectoColegio.Data;
using ProyectoColegio.Models;

namespace ProyectoColegio.Controllers
{
    public class GeneroController : Controller
    {
        private readonly Contexto _contexto;
        Genero genero = new Genero();

        public GeneroController(Contexto contexto)
        {
            _contexto = contexto;
        }

        public List<string> LeerGenero()
        {
            LecturaJson lecturaJson = new LecturaJson();

            //llama el metodo para la lectura del json
            genero.setGeneros(lecturaJson.Resultado("Archivos_Json/Genero.json"));

            return (genero.getGeneros());
        }


        public IActionResult RegistrarGenero()
        {
            return View();
        }


        [HttpPost]
        public IActionResult RegistrarGenero(Genero genero)
        {
            
            try
            {

                foreach (string dato in LeerGenero())
                {
                    using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
                    {
                        conexion.Open();
                        MySqlCommand Command = new MySqlCommand("registrarGenero", conexion);
                        Command.CommandType = System.Data.CommandType.StoredProcedure;
                        Command.Parameters.AddWithValue("nomGenero", dato);
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
