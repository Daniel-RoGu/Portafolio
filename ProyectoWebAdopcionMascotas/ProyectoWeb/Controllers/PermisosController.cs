using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProyectoWeb.Data;
using ProyectoWeb.Models;
using System.Data;

namespace ProyectoWeb.Controllers
{
    public class PermisosController : Controller
    {

        private readonly Contexto _contexto;

        public PermisosController(Contexto contexto)
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
            List<Permisos> listadopermiso = new List<Permisos>();
            try
            {
                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "listar_permiso";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    Permisos p = new Permisos();
                    p.idPermiso = mySqlDataReader.GetInt32(0);
                    p.nombrePermiso = mySqlDataReader.GetString(1);
                    p.estadoPermiso = mySqlDataReader.GetString(2);
                    listadopermiso.Add(p);
                }
                conexion.Close();


            }
            catch (Exception)
            {
                throw;
            }

            return View(listadopermiso);
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
        public IActionResult Registrar(Permisos p)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                MySqlCommand Command = new MySqlCommand("insertar_permiso", conexion);
                Command.CommandType = System.Data.CommandType.StoredProcedure;
                Command.Parameters.AddWithValue("id_Permiso", p.idPermiso);
                Command.Parameters.AddWithValue("nombre_Permiso", p.nombrePermiso);
                Command.Parameters.AddWithValue("estado_Permiso", p.estadoPermiso);
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

            Permisos p = new Permisos();
            DataTable tabla = new DataTable();
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                string sql = "obtener_permiso(@idPermiso)";
                MySqlDataAdapter sqlData = new MySqlDataAdapter(sql, conexion);
                sqlData.SelectCommand.Parameters.AddWithValue("@idPermiso", id);
                sqlData.Fill(tabla);
            }
            if (tabla.Rows.Count == 1)
            {
                p.idPermiso = Convert.ToInt32(tabla.Rows[0][0].ToString());
                p.nombrePermiso = tabla.Rows[0][1].ToString();
                p.estadoPermiso = tabla.Rows[0][2].ToString();
                return View(p);
            }
            else
            {
                return RedirectToAction("Mostrar");
            }

        }



        [HttpPost]
        public IActionResult Editar(Permisos p)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                String sql = "call editar_permiso(@idPermiso,@nombrePermiso, @estadoPermiso)";
                MySqlCommand Command = new MySqlCommand(sql, conexion);
                Command.Parameters.AddWithValue("@idPermiso", p.idPermiso);
                Command.Parameters.AddWithValue("@nombrePermiso", p.nombrePermiso);
                Command.Parameters.AddWithValue("@estadoPermiso", p.estadoPermiso);
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
                String sql = "call eliminar_permiso(@idPermiso)";
                MySqlCommand Command = new MySqlCommand(sql, conexion);
                Command.Parameters.AddWithValue("@idPermiso", id);
                Command.ExecuteNonQuery();
            }

            return RedirectToAction("Mostrar");
        }
    }
}
