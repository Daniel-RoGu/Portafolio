using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProyectoWeb.Data;
using ProyectoWeb.Models;

namespace ProyectoWeb.Controllers
{
    public class Mascota_VacunasController : Controller
    {
        private readonly Contexto _contexto;

        public Mascota_VacunasController(Contexto contexto)
        {
            _contexto = contexto;
        }

        //public Mascota_VacunasController()
        //{
        //}

        public IActionResult Index()
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            return View();
        }

        public bool Registrar(int fk_idMascota, int fk_idVacuna, string fechaVacuna)
        {

            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                MySqlCommand Command = new MySqlCommand("insertar_mascota_vacuna", conexion);
                Command.CommandType = System.Data.CommandType.StoredProcedure;
                Command.Parameters.AddWithValue("fk_idMascota", fk_idMascota);
                Command.Parameters.AddWithValue("fk_idVacunas", fk_idVacuna);
                Command.Parameters.AddWithValue("fechaVacuna", fechaVacuna);
              

                Command.ExecuteNonQuery();
                conexion.Close();
            }

            return true;
            
        }

    }
}
