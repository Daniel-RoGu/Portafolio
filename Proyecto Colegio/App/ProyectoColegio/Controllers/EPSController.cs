using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProyectoColegio.Data;
using ProyectoColegio.Models;

namespace ProyectoColegio.Controllers
{
    public class EPSController : Controller
    {

        private readonly Contexto _contexto;
        EPS eps = new EPS();

        public EPSController(Contexto contexto)
        {
            _contexto = contexto;
        }

        public List<string> LeerEPS()
        {
            //List<string> datos = null;
            LecturaJson lecturaJson = new LecturaJson();

            //llama el metodo para la lectura del json
            eps.EPSs = (lecturaJson.Resultado("Archivos_Json/EPS.json"));

            //return datos;
            return (eps.EPSs);
        }


        public IActionResult RegistrarEPS()
        {
            return View();
        }


        [HttpPost]
        public IActionResult RegistrarEPS(EPS eps)
        {
            //LeerSisben();

            try
            {

                foreach (string dato in LeerEPS())
                {
                    using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
                    {
                        conexion.Open();
                        MySqlCommand Command = new MySqlCommand("registrarEPS", conexion);
                        Command.CommandType = System.Data.CommandType.StoredProcedure;
                        Command.Parameters.AddWithValue("nomEPS", dato);
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
