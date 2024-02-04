using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProyectoColegio.Data;
using ProyectoColegio.Models;

namespace ProyectoColegio.Controllers
{
    public class TipoSangreController : Controller
    {
        private readonly Contexto _contexto;
        TipoSangre tipoSangre = new TipoSangre();

        public TipoSangreController(Contexto contexto)
        {
            _contexto = contexto;
        }

        public List<string> LeerTipoSangre()
        {
            LecturaJson lecturaJson = new LecturaJson();

            //llama el metodo para la lectura del json
            tipoSangre.TpSangre = (lecturaJson.Resultado("Archivos_Json/TipoDeSangre.json"));

            //return datos;
            return (tipoSangre.TpSangre);
        }


        public IActionResult RegistrarTipoSangre()
        {
            return View();
        }


        [HttpPost]
        public IActionResult RegistrarTipoSangre(TipoSangre tipoSangre)
        {

            try
            {

                foreach (string dato in LeerTipoSangre())
                {
                    using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
                    {
                        conexion.Open();
                        MySqlCommand Command = new MySqlCommand("registrarTipoSangre", conexion);
                        Command.CommandType = System.Data.CommandType.StoredProcedure;
                        Command.Parameters.AddWithValue("nomTpSangre", dato);
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
