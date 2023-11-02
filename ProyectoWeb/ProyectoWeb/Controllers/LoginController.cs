using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProyectoWeb.Data;
using Microsoft.AspNetCore.Http;
using MySqlX.XDevAPI;

namespace ProyectoWeb.Controllers
{
    public class LoginController : Controller
    {
        CookieOptions coo = new CookieOptions();
        private readonly Contexto _contexto;
        public LoginController(Contexto contexto)
        {
            _contexto = contexto;
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Login()
        {
            return View();
        }

        public IActionResult iniciar(string nombreUsuario, string contrasenaUsuario)
        {
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                String sql = "call obtener_rol_persona(@nombreUsuario, @contrasenaUsuario)";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                conexionCommand.Parameters.AddWithValue("@nombreUsuario", nombreUsuario);
                conexionCommand.Parameters.AddWithValue("@contrasenaUsuario", contrasenaUsuario);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();


                try
                {
                    if (mySqlDataReader.Read())
                    {
                        ViewBag.temporal1 = mySqlDataReader[0].ToString();
                        ViewBag.temporal2 = mySqlDataReader[1].ToString();
                        ViewBag.temporal3 = mySqlDataReader[2].ToString();
                        ViewBag.temporal4 = mySqlDataReader[3].ToString();

                    }
                    HttpContext.Response.Cookies.Append("var", mySqlDataReader[1].ToString(), coo);
                    HttpContext.Response.Cookies.Append("idUsuario", mySqlDataReader[3].ToString(), coo);
                    HttpContext.Response.Cookies.Append("idPersona", mySqlDataReader[0].ToString(), coo);

                    //navegacion();
                    conexion.Close();
                    return RedirectToAction("Principal", "Mascota");
                }
                catch (Exception)
                {

                    return RedirectToAction("Registrar", "Persona");
                }   

            }


        }

        public IActionResult Cerrar() {
            
            HttpContext.Response.Cookies.Delete("var"); 
            return RedirectToAction("Index", "Principal");
        }

        //public List<string> navegacion()
        //{
        //    var id_usuario = ViewBag.temporal4;
        //    List<string> navegacion = new List<string>();

        //    using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
        //    {
        //        conexion.Open();
        //        String sql = "call navegacion_por_usuario(@id_usuario)";
        //        MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
        //        conexionCommand.Parameters.AddWithValue("@id_usuario", id_usuario);
        //        MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

        //        while (mySqlDataReader.Read())
        //        {
        //            navegacion.Add(mySqlDataReader.GetString(0));
        //            navegacion.Add(mySqlDataReader.GetString(1));
        //            navegacion.Add(mySqlDataReader.GetString(2));
        //        }
        //        conexion.Close();
        //    }

        //    ViewData["MiLista"] = navegacion;
        //    return navegacion;

        //}

        //public List<string> permisos()
        //{
        //    List<string> carpetas = new List<string>();

        //    var id_usuario = ViewBag.temporal4;
        //    List<Objectnav> navegacion = new List<Objectnav>();

        //    using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
        //    {
        //        conexion.Open();
        //        String sql = "call listar_permisos_carpetaRaiz(@id_usuario)";
        //        MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
        //        conexionCommand.Parameters.AddWithValue("@id_usuario", id_usuario);
        //        MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

        //        while (mySqlDataReader.Read())
        //        {
        //            carpetas.Add(mySqlDataReader.GetString(0));
        //        }
        //        conexion.Close();
        //    }

        //    return carpetas;

        //}

    }
}


public class Objectnav{
    public string vista { get; set; } = null!;
    public string url { get; set; } = null!;
} 

public class Objectpermisos
{
    public string carpeta { get; set; } = null!;

    public object navegacion = null!;

}