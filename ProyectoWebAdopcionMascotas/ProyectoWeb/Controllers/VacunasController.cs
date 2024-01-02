using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProyectoWeb.Data;
using ProyectoWeb.Models;
using System.Data;

namespace ProyectoWeb.Controllers
{
    public class VacunasController : Controller
    {
        private readonly Contexto _contexto;

        public VacunasController(Contexto contexto)
        {
            _contexto = contexto;
        }

        public List<Vacunas> listarvacunas()
        {

            List<Vacunas> listadovacunas = new List<Vacunas>();
            try
            {
                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "listar_vacunas";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    Vacunas v = new Vacunas();
                    v.idVacunas = mySqlDataReader.GetInt32(0);
                    v.nombreVacuna = mySqlDataReader.GetString(1);
                    v.estadoVacuna = mySqlDataReader.GetString(2);
                    listadovacunas.Add(v);
                }
                conexion.Close();


            }
            catch (Exception)
            {
                throw;
            }

            return listadovacunas;
        }



        [HttpGet]
        public IActionResult Mostrar()
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            List<Vacunas> listadovacuna = new List<Vacunas>();
            try
            {
                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "listar_vacunas";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    Vacunas va = new Vacunas();
                    va.idVacunas = mySqlDataReader.GetInt32(0);
                    va.nombreVacuna = mySqlDataReader.GetString(1);
                    va.estadoVacuna = mySqlDataReader.GetString(2);
                    listadovacuna.Add(va);
                }
                conexion.Close();


            }
            catch (Exception)
            {
                throw;
            }

            return View(listadovacuna);
        }



        public IActionResult Registrar()
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            return View();
        }


        [HttpPost]
        public IActionResult Registrar(Vacunas vacuna)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                MySqlCommand Command = new MySqlCommand("insertar_vacunas", conexion);
                Command.CommandType = System.Data.CommandType.StoredProcedure;
                Command.Parameters.AddWithValue("idVacuna", vacuna.idVacunas);
                Command.Parameters.AddWithValue("nombreVacuna", vacuna.nombreVacuna);
                Command.Parameters.AddWithValue("estadoVacuna", vacuna.estadoVacuna);
                Command.ExecuteNonQuery();
            }

            return RedirectToAction("Mostrar");
        }


        public IActionResult Editar(int id)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            Vacunas vacuna = new Vacunas();
            DataTable tabla = new DataTable();
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                string sql = "obtener_vacunas(@idVacunas)";
                MySqlDataAdapter sqlData = new MySqlDataAdapter(sql, conexion);
                sqlData.SelectCommand.Parameters.AddWithValue("@idVacunas", id);
                sqlData.Fill(tabla);
            }
            if (tabla.Rows.Count == 1)
            {
                vacuna.idVacunas = Convert.ToInt32(tabla.Rows[0][0].ToString());
                vacuna.nombreVacuna = tabla.Rows[0][1].ToString();
                vacuna.estadoVacuna= tabla.Rows[0][2].ToString();
                return View(vacuna);
            }
            else
            {
                return RedirectToAction("Mostrar");
            }
        }


        [HttpPost]
        public IActionResult Editar(Vacunas vacuna)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                String sql = "call editar_vacuna(@idVacunas,@nombreVacuna,@estadoVacuna)";

                MySqlCommand Command = new MySqlCommand(sql, conexion);
                Command.Parameters.AddWithValue("@idVacunas", vacuna.idVacunas);
                Command.Parameters.AddWithValue("@nombreVacuna", vacuna.nombreVacuna);
                Command.Parameters.AddWithValue("@estadoVacuna", vacuna.estadoVacuna);
                Command.ExecuteNonQuery();
            }


            return RedirectToAction("Mostrar");

        }


        public IActionResult Eliminar(int id)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                String sql = "call eliminar_vacuna(@idVacunas)";
                MySqlCommand Command = new MySqlCommand(sql, conexion);
                Command.Parameters.AddWithValue("@idVacunas", id);
                Command.ExecuteNonQuery();
            }

            return RedirectToAction("Mostrar");
        }

    }
}
