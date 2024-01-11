using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProyectoColegio.Data;
using ProyectoColegio.Models;

namespace ProyectoColegio.Controllers
{
    public class EstratoController : Controller
    {
        private readonly Contexto _contexto;
        Estrato estrato = new Estrato();

        public EstratoController(Contexto contexto)
        {
            _contexto = contexto;
        }

        public List<string> LeerEstrato()
        {
            //List<string> datos = null;
            LecturaJson lecturaJson = new LecturaJson();

            //llama el metodo para la lectura del json
            estrato.setEstratos(lecturaJson.Resultado("Archivos_Json/Estrato.json"));

            //return datos;
            return (estrato.getEstratos());
        }


        public IActionResult RegistrarEstrato()
        {
            return View();
        }


        [HttpPost]
        public IActionResult RegistrarEstrato(Estrato estrato)
        {
            //LeerSisben();

            try
            {

                foreach (string dato in LeerEstrato())
                {
                    using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
                    {
                        conexion.Open();
                        MySqlCommand Command = new MySqlCommand("registrarEstrato", conexion);
                        Command.CommandType = System.Data.CommandType.StoredProcedure;
                        Command.Parameters.AddWithValue("nomEstrato", dato);
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

