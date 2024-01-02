using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProyectoWeb.Data;
using ProyectoWeb.Models;
using System.Data;

namespace ProyectoWeb.Controllers
{
    public class Tipo_MascotaController : Controller
    {

        private readonly Contexto _contexto;

        public Tipo_MascotaController(Contexto contexto)
        {
            _contexto = contexto;
        }

        public IActionResult Mostrar()
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            List<Tipo_Mascota> listadotp = new List<Tipo_Mascota>();
            try
            {
                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "listar_tp_mascota";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    Tipo_Mascota tp = new Tipo_Mascota();
                    tp.idTipoMascota = mySqlDataReader.GetInt32(0);
                    tp.tipoMascota = mySqlDataReader.GetString(1);
                    tp.estadoTipoMascota = mySqlDataReader.GetString(2);
                    listadotp.Add(tp);
                }
                conexion.Close();


            }
            catch (Exception)
            {
                throw;
            }

            return View(listadotp);
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
        public IActionResult Registrar(Tipo_Mascota tipo)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                MySqlCommand Command = new MySqlCommand("insertar_tp_mascota", conexion);
                Command.CommandType = System.Data.CommandType.StoredProcedure;
                Command.Parameters.AddWithValue("tipoMacota", tipo.tipoMascota);
                Command.Parameters.AddWithValue("estadoTpMascota", tipo.estadoTipoMascota);
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

            Tipo_Mascota tm = new Tipo_Mascota();
            DataTable tabla = new DataTable();
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                string sql = "obtener_tp_mascota(@idTipoMascota)";
                MySqlDataAdapter sqlData = new MySqlDataAdapter(sql, conexion);
                sqlData.SelectCommand.Parameters.AddWithValue("@idTipoMascota", id);
                sqlData.Fill(tabla);
            }
            if (tabla.Rows.Count == 1)
            {
                tm.idTipoMascota= Convert.ToInt32(tabla.Rows[0][0].ToString());
                tm.tipoMascota = tabla.Rows[0][1].ToString();
                tm.estadoTipoMascota = tabla.Rows[0][2].ToString();
                return View(tm);
            }
            else
            {
                return RedirectToAction("Mostrar");
            }

        }


        [HttpPost]
        public IActionResult Editar(Tipo_Mascota tm)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open(); 
                String sql = "call editar_tp_mascota (@idTipo_Mascota,@tipoMacota, @estadoTpMascota)";
                MySqlCommand Command = new MySqlCommand(sql, conexion);
                Command.Parameters.AddWithValue("@idTipo_Mascota", tm.idTipoMascota);
                Command.Parameters.AddWithValue("@tipoMacota", tm.tipoMascota);
                Command.Parameters.AddWithValue("@estadoTpMascota", tm.estadoTipoMascota);
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
                String sql = "call eliminar_tp_mascota(@idTipo_Mascota)";
                MySqlCommand Command = new MySqlCommand(sql, conexion);
                Command.Parameters.AddWithValue("@idTipo_Mascota", id);
                Command.ExecuteNonQuery();
            }

            return RedirectToAction("Mostrar");
        }


    }
}
