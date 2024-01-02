using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProyectoWeb.Data;
using ProyectoWeb.Models;
using System.Data;

namespace ProyectoWeb.Controllers
{
    public class RazaController : Controller
    {
        CookieOptions coo = new CookieOptions();
        private readonly Contexto _contexto;

        public RazaController(Contexto contexto)
        {
            _contexto = contexto;
        }
        public IActionResult Index()
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            return View();
        }

        [HttpGet]

        public IActionResult Mostrar()
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();

            if (rols.ToString() == "Administrador")
            {
                List<Raza> listadoraza = new List<Raza>();
                try
                {
                    MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                    conexion.Open();
                    String sql = "listar_raza";
                    MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                    MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                    while (mySqlDataReader.Read())
                    {
                        Raza raza = new Raza();
                        raza.idRaza = mySqlDataReader.GetInt32(0);
                        raza.nombreRaza = mySqlDataReader.GetString(1);
                        raza.estadoRaza = mySqlDataReader.GetString(2);
                        listadoraza.Add(raza);
                    }
                    conexion.Close();


                }
                catch (Exception)
                {
                    throw;
                }

                return View(listadoraza);

            }
            else
            {
                return RedirectToAction("Error");
            }


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
        public IActionResult Registrar(Raza raza)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();

            if (rols.ToString() == "Administrador")
            {
                using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
                {
                    conexion.Open();
                    MySqlCommand Command = new MySqlCommand("insertar_raza", conexion);
                    Command.CommandType = System.Data.CommandType.StoredProcedure;
                    Command.Parameters.AddWithValue("id_Raza", raza.idRaza);
                    Command.Parameters.AddWithValue("nombre_Raza", raza.nombreRaza);
                    Command.Parameters.AddWithValue("estado_Raza", raza.estadoRaza);
                    Command.ExecuteNonQuery();
                }

                return RedirectToAction("Mostrar");
            }
            else
            {
                return RedirectToAction("Error");
            }


            
        }



        public IActionResult Editar(int id)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            Raza raza = new Raza();
            DataTable tabla = new DataTable();
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                string sql = "obtener_raza(@idRaza)";
                MySqlDataAdapter sqlData = new MySqlDataAdapter(sql, conexion);
                sqlData.SelectCommand.Parameters.AddWithValue("@idRaza", id);
                sqlData.Fill(tabla);
            }
            if (tabla.Rows.Count == 1)
            {
                raza.idRaza = Convert.ToInt32(tabla.Rows[0][0].ToString());
                raza.nombreRaza = tabla.Rows[0][1].ToString();
                raza.estadoRaza = tabla.Rows[0][2].ToString();
                return View(raza);
            }
            else
            {
                return RedirectToAction("Mostrar");
            }
        }


        [HttpPost]
        public IActionResult Editar(Raza raza)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                String sql = "call editar_raza(@idRaza,@nombreRaza,@estadoRaza)";

                MySqlCommand Command = new MySqlCommand(sql, conexion);
                Command.Parameters.AddWithValue("@idRaza", raza.idRaza);
                Command.Parameters.AddWithValue("@nombreRaza", raza.nombreRaza);
                Command.Parameters.AddWithValue("@estadoRaza", raza.estadoRaza);
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
                //String sql = "delete from raza where idRaza = @idRaza";
                String sql = "call eliminar_raza(@idRaza)";
                MySqlCommand Command = new MySqlCommand(sql, conexion);
                Command.Parameters.AddWithValue("@idRaza", id);
                Command.ExecuteNonQuery();
            }

            return RedirectToAction("Mostrar");
        }


    }
}
