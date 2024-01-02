using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProyectoWeb.Data;
using ProyectoWeb.Models;
using System;
using System.Collections.Generic;
using System.Data;

namespace ProyectoWeb.Controllers
{
    public class PersonaController : Controller
    {
        private readonly Contexto _contexto;

        public PersonaController(Contexto contexto)
        {
            _contexto = contexto;
        }



        public IActionResult Obtener()
        {
            var idPersona = HttpContext.Request.Cookies["idPersona"];
            ViewBag.idPersona = idPersona.ToString();
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.Mensaje = rols.ToString();

            List<Persona> listaPersona = new List<Persona>();
            try
            {
                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "obtener_persona(@idPersona)";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                conexionCommand.Parameters.AddWithValue("@idPersona", ViewBag.idPersona);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    Persona p = new Persona();
                    p.idPersona = mySqlDataReader.GetInt32(0);
                    p.nombrePersona = mySqlDataReader.GetString(1);
                    p.apellidoPersona = mySqlDataReader.GetString(2);
                    p.edadPersona = mySqlDataReader.GetInt32(3);
                    p.telefonoPersona = mySqlDataReader.GetString(4);
                    p.ubicacionPersona = mySqlDataReader.GetString(5);
                    p.correoPersona = mySqlDataReader.GetString(6);
                    p.fk_idTipoDocumento = Id_tpDocumento(p.idPersona);

                    listaPersona.Add(p);
                }
                conexion.Close();


            }
            catch (Exception)
            {
                throw;
            }

            return View(listaPersona);
        }



        public int Id_tpDocumento(int id_persona)
        {
            //var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            //var rols = HttpContext.Request.Cookies["var"];
            //ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            //ViewBag.Mensaje = rols.ToString();
            int id = 0;

            try
            {
                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "call obtener_fkIdTipoDocumento(@id_Persona)";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                conexionCommand.Parameters.AddWithValue("@id_Persona", id_persona);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    id = mySqlDataReader.GetInt32(0);
                }
                conexion.Close();

            }
            catch (Exception)
            {
                throw;
            }

            return id;
        }


        [HttpGet]
        //0 refencia
        public IActionResult Mostrar()
        {
            
            List<Persona> listaPersona = new List<Persona>();
            try
            {
                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "listar_persona";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();
               

                while (mySqlDataReader.Read())
                {
                    Persona p = new Persona();
                    p.idPersona = mySqlDataReader.GetInt32(0);
                    p.nombrePersona = mySqlDataReader.GetString(1);
                    p.apellidoPersona = mySqlDataReader.GetString(2);
                    p.edadPersona = mySqlDataReader.GetInt32(3);
                    p.telefonoPersona = mySqlDataReader.GetString(4);
                    p.ubicacionPersona = mySqlDataReader.GetString(5);
                    p.correoPersona = mySqlDataReader.GetString(6);
                    p.fk_idTipoDocumento = Id_tpDocumento(p.idPersona);

                    listaPersona.Add(p);

             
                }
                conexion.Close();

            }
            catch (Exception)
            {
                throw;
            }

            var rols = HttpContext.Request.Cookies["var"];

            if (rols != null) {
                ViewBag.Mensaje = rols.ToString();
            }
           
            if (ViewBag.Mensaje == "Administrador")
            {
                return View(listaPersona);
            }
            else
            {
                return RedirectToAction("Index", "Principal");
            }

        }
    
           
        

        public IActionResult Registrar()
        {
            TipoDocumentoController tpdc = new TipoDocumentoController(_contexto);
            ViewBag.tp_doc = tpdc.listardocumento();
            return View();
        }

        [HttpPost]
        public IActionResult Registrar(Persona p)
        {
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                MySqlCommand Command = new MySqlCommand("insertar_persona", conexion);
                Command.CommandType = System.Data.CommandType.StoredProcedure;
                Command.Parameters.AddWithValue("idPersona", p.idPersona);
                Command.Parameters.AddWithValue("nombre_Persona", p.nombrePersona);
                Command.Parameters.AddWithValue("apellido_Persona", p.apellidoPersona);
                Command.Parameters.AddWithValue("edad_Persona", p.edadPersona);
                Command.Parameters.AddWithValue("telefono_Persona", p.telefonoPersona);
                Command.Parameters.AddWithValue("ubicacion_Persona", p.ubicacionPersona);
                Command.Parameters.AddWithValue("correo_Persona", p.correoPersona);
                Command.Parameters.AddWithValue("TpDocumento", p.fk_idTipoDocumento);
                Command.Parameters.AddWithValue("nombreUsuario", p.nombreUsuario);
                Command.Parameters.AddWithValue("contrasenaUsuario", p.contrasenaUsuario);
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

            Persona p = new Persona();
            DataTable tabla = new DataTable();
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                string sql = "obtener_persona(@idPersona)";
                MySqlDataAdapter sqlData = new MySqlDataAdapter(sql, conexion);
                sqlData.SelectCommand.Parameters.AddWithValue("@idPersona", id);
                sqlData.Fill(tabla);
            }
            if (tabla.Rows.Count == 1)
            {
                p.idPersona = Convert.ToInt32(tabla.Rows[0][0].ToString());
                p.nombrePersona = tabla.Rows[0][1].ToString();
                p.apellidoPersona = tabla.Rows[0][2].ToString();
                p.edadPersona = Convert.ToInt32(tabla.Rows[0][3].ToString());
                p.telefonoPersona = tabla.Rows[0][4].ToString();
                p.ubicacionPersona = tabla.Rows[0][5].ToString();
                p.correoPersona = tabla.Rows[0][6].ToString();
                p.fk_idTipoDocumento = Convert.ToInt32(tabla.Rows[0][7].ToString());
                return View(p);
            }
            else
            {
                if (ViewBag.Mensaje == "Administrador")
                {
                    return RedirectToAction("Mostrar");
                }
                else
                {
                    return RedirectToAction("Obtener");
                }
               
            }

        }
        [HttpPost]
        public IActionResult Editar(Persona p)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();

            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                //String sql = "update tipo_documento set tipoDocumento =@tipoDocumento, estadoDocumento = @estadoDocumento where idTipoDocumento = @idTipoDocumento";
                String sql = "call editar_persona (@idPersona, @nombrePersona, @apellidoPersona, @edadPersona, @telefonoPersona, @ubicacionPersona, @correoPersona, @fk_idTipoDocumento)";
                MySqlCommand Command = new MySqlCommand(sql, conexion);
                Command.Parameters.AddWithValue("@idPersona", p.idPersona);
                Command.Parameters.AddWithValue("@nombrePersona", p.nombrePersona);
                Command.Parameters.AddWithValue("@apellidoPersona", p.apellidoPersona);
                Command.Parameters.AddWithValue("@edadPersona", p.edadPersona);
                Command.Parameters.AddWithValue("@telefonoPersona", p.telefonoPersona);
                Command.Parameters.AddWithValue("@ubicacionPersona", p.ubicacionPersona);
                Command.Parameters.AddWithValue("@correoPersona", p.correoPersona);
                Command.Parameters.AddWithValue("@fk_idTipoDocumento", p.fk_idTipoDocumento);
                Command.ExecuteNonQuery();
            }

            if (ViewBag.Mensaje == "Administrador")
            {
                return RedirectToAction("Mostrar");
            }
            else
            {
                return RedirectToAction("Obtener");
            }


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
                String sql = "call eliminar_persona(@idPersona)";
                MySqlCommand Command = new MySqlCommand(sql, conexion);
                Command.Parameters.AddWithValue("@idPersona", id);
                Command.ExecuteNonQuery();
            }

            return RedirectToAction("Mostrar");
        }  

        public IActionResult ObtenerPersona(int id)
        {
            var idPersona = HttpContext.Request.Cookies["idPersona"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idPersona = idPersona.ToString();
            var idp = ViewBag.idPersona;
            ViewBag.Mensaje = rols.ToString();

            List<Persona> listaPersona = new List<Persona>();
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {

                conexion.Open();

                String sql = "call obtener_persona(@id_Persona)";
                MySqlCommand Command = new MySqlCommand(sql, conexion);
                Command.Parameters.AddWithValue("@id_Persona", idusuarioPersona(idp));
                Command.ExecuteNonQuery();
                MySqlDataReader mySqlDataReader = Command.ExecuteReader();

                if (mySqlDataReader.Read())
                {
                    Persona p = new Persona();
                    p.nombrePersona = mySqlDataReader.GetString(1);
                    p.apellidoPersona = mySqlDataReader.GetString(2);
                    p.edadPersona = mySqlDataReader.GetInt32(3);
                    p.telefonoPersona = mySqlDataReader.GetString(4);
                    p.ubicacionPersona = mySqlDataReader.GetString(5);
                    p.correoPersona = mySqlDataReader.GetString(6);

                    listaPersona.Add(p);
                }
                conexion.Close();
            }

            return View(listaPersona);
        }

        public int idusuarioPersona(int id)
        {
            int idp = 0;



            MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
            conexion.Open();
            String sql = "call obtener_usuariopersona(@id_Persona)";
            MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
            conexionCommand.Parameters.AddWithValue("@id_Persona", id);
            MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();



            while (mySqlDataReader.Read())
            {
                idp = mySqlDataReader.GetInt32(0);
            }
            conexion.Close();



            return idp;
        }
    }
}
