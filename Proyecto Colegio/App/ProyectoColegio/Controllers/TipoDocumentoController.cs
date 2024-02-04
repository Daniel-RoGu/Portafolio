using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProyectoColegio.Data;
using ProyectoColegio.Models;

namespace ProyectoColegio.Controllers
{
    public class TipoDocumentoController : Controller
    {
        private readonly Contexto _contexto;
        TipoDocumento tipoDocumento = new TipoDocumento();

        public TipoDocumentoController(Contexto contexto)
        {
            _contexto = contexto;
        }

        public List<string> LeerTipoDocumento()
        {
            LecturaJson lecturaJson = new LecturaJson();

            //llama el metodo para la lectura del json
            tipoDocumento.TpDocumento = (lecturaJson.Resultado("Archivos_Json/TipoDeDocumento.json"));

            //return datos;
            return (tipoDocumento.TpDocumento);
        }


        public IActionResult RegistrarTipoDocumento()
        {
            return View();
        }


        [HttpPost]
        public IActionResult RegistrarTipoDocumento(TipoDocumento tipoDocumento)
        {

            try
            {

                foreach (string dato in LeerTipoDocumento())
                {
                    using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
                    {
                        conexion.Open();
                        MySqlCommand Command = new MySqlCommand("registrarTipoDocumento", conexion);
                        Command.CommandType = System.Data.CommandType.StoredProcedure;
                        Command.Parameters.AddWithValue("nomTpDocumento", dato);
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
