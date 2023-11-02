using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Relational;
using ProyectoWeb.Data;
using ProyectoWeb.Models;
using System.Data;

namespace ProyectoWeb.Controllers
{
    public class TipoDocumentoController : Controller
    {
        private readonly Contexto _contexto;

        public TipoDocumentoController(Contexto contexto)
        {
            _contexto = contexto;
        }

        public List<TipoDocumento> listardocumento()
        {
            //var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            //var rols = HttpContext.Request.Cookies["var"];
            //ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            //ViewBag.Mensaje = rols.ToString();
            List<TipoDocumento> listadocumento = new List<TipoDocumento>();
            try
            {
                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "listar_tp_documento";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    TipoDocumento td = new TipoDocumento();
                    td.idTipoDocumento = mySqlDataReader.GetInt32(0);
                    td.tipoDocumento = mySqlDataReader.GetString(1);
                    td.estadoDocumento = mySqlDataReader.GetString(2);
                    listadocumento.Add(td);
                }
                conexion.Close();


            }
            catch (Exception)
            {
                throw;
            }
           
            return listadocumento;
        }



        [HttpGet]
        //0 refencia
        public IActionResult Mostrar()
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            List<TipoDocumento> listadocumento = new List<TipoDocumento>();
            try
            {
                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "listar_tp_documento";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    TipoDocumento td = new TipoDocumento();
                    td.idTipoDocumento = mySqlDataReader.GetInt32(0);
                    td.tipoDocumento = mySqlDataReader.GetString(1);
                    td.estadoDocumento = mySqlDataReader.GetString(2);
                    listadocumento.Add(td);
                }
                conexion.Close();


            }
            catch (Exception)
            {
                throw;
            }
           
            return View(listadocumento);
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
        public IActionResult Registrar (TipoDocumento tipo)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion)) {
                conexion.Open();
                MySqlCommand Command = new MySqlCommand("insertar_tp_documento", conexion);
                Command.CommandType = System.Data.CommandType.StoredProcedure;
                Command.Parameters.AddWithValue("idTipo_Documento", tipo.idTipoDocumento);
                Command.Parameters.AddWithValue("tipo_Documento", tipo.tipoDocumento);
                Command.Parameters.AddWithValue("estadoTpDocumento", tipo.estadoDocumento);
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

            TipoDocumento tp = new TipoDocumento(); 
            DataTable tabla = new DataTable();
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                string sql = "obtener_tp_documento(@idtipodocumento)";
                MySqlDataAdapter sqlData = new MySqlDataAdapter(sql,conexion);
                sqlData.SelectCommand.Parameters.AddWithValue ("@idTipoDocumento", id);
                sqlData.Fill(tabla);
            }
            if (tabla.Rows.Count == 1)
            {
                tp.idTipoDocumento = Convert.ToInt32(tabla.Rows[0][0].ToString());
                tp.tipoDocumento = tabla.Rows[0][1].ToString();
                tp.estadoDocumento = tabla.Rows[0][2].ToString();
                return View(tp);
            }
            else
            {
                return RedirectToAction("Mostrar");
            }
             
        }

        
        [HttpPost]
        public IActionResult Editar(TipoDocumento td)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                //String sql = "update tipo_documento set tipoDocumento =@tipoDocumento, estadoDocumento = @estadoDocumento where idTipoDocumento = @idTipoDocumento";
                String sql = "call editar_tp_documento (@idTipoDocumento,@tipoDocumento, @estadoDocumento)";
                MySqlCommand Command = new MySqlCommand(sql, conexion);
                Command.Parameters.AddWithValue("@idTipoDocumento", td.idTipoDocumento);
                Command.Parameters.AddWithValue("@tipoDocumento", td.tipoDocumento);
                Command.Parameters.AddWithValue("@estadoDocumento", td.estadoDocumento);
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
                String sql = "call eliminar_tp_documento(@idTipoDocumento)";
                MySqlCommand Command = new MySqlCommand(sql, conexion);
                Command.Parameters.AddWithValue("@idTipoDocumento", id);
                Command.ExecuteNonQuery();
            }

            return RedirectToAction("Mostrar");
        }


    }


}





