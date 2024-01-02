using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProyectoWeb.Data;
using ProyectoWeb.Models;
using System.Data;

namespace ProyectoWeb.Controllers
{
    public class RolesController : Controller
    {

        private readonly Contexto _contexto;

        public RolesController(Contexto contexto)
        {
            _contexto = contexto;
        }
        [HttpGet]
        //0 refencia
        public IActionResult Mostrar()
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            List<Roles> listadoroles = new List<Roles>();
            try
            {
                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "listar_rol";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    Roles  r = new Roles();
                    r.idRol = mySqlDataReader.GetInt32(0);
                    r.nombreRol = mySqlDataReader.GetString(1);
                    r.estadoRol = mySqlDataReader.GetString(2);
                    listadoroles.Add(r);
                }
                conexion.Close();


            }
            catch (Exception)
            {
                throw;
            }

            return View(listadoroles);
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
        public IActionResult Registrar(Roles r)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                MySqlCommand Command = new MySqlCommand("insertar_rol", conexion);
                Command.CommandType = System.Data.CommandType.StoredProcedure;
                Command.Parameters.AddWithValue("id_Rol", r.idRol);
                Command.Parameters.AddWithValue("nombre_Rol", r.nombreRol);
                Command.Parameters.AddWithValue("estado_Rol", r.estadoRol);
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

            Roles r = new Roles();
            DataTable tabla = new DataTable();
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                string sql = "obtener_rol(@idRol)";
                MySqlDataAdapter sqlData = new MySqlDataAdapter(sql, conexion);
                sqlData.SelectCommand.Parameters.AddWithValue("@idRol", id);
                sqlData.Fill(tabla);
            }
            if (tabla.Rows.Count == 1)
            {
                r.idRol = Convert.ToInt32(tabla.Rows[0][0].ToString());
                r.nombreRol = tabla.Rows[0][1].ToString();
                r.estadoRol = tabla.Rows[0][2].ToString();
                return View(r);
            }
            else
            {
                return RedirectToAction("Mostrar");
            }

        }

        [HttpPost]
        public IActionResult Editar(Roles r)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                String sql = "call editar_rol(@idRol,@nombreRol, @estadoRol)";
                MySqlCommand Command = new MySqlCommand(sql, conexion);
                Command.Parameters.AddWithValue("@idRol", r.idRol);
                Command.Parameters.AddWithValue("@nombreRol", r.nombreRol);
                Command.Parameters.AddWithValue("@estadoRol", r.estadoRol);
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
                String sql = "call eliminar_rol(@idRol)";
                MySqlCommand Command = new MySqlCommand(sql, conexion);
                Command.Parameters.AddWithValue("@idRol", id);
                Command.ExecuteNonQuery();
            }

            return RedirectToAction("Mostrar");
        }
    }
}
