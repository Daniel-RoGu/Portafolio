using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Relational;
using ProyectoWeb.Data;
using ProyectoWeb.Models;
using ProyectoWeb.Controllers;
using System.Data;
using Microsoft.AspNetCore.Http;
using Org.BouncyCastle.Asn1.X509;

namespace ProyectoWeb.Controllers
{
    public class AdopcionController : Controller
    {
        private readonly Contexto _contexto;
        //CookieOptions coo = new CookieOptions();

        public AdopcionController(Contexto contexto)
        {
            _contexto = contexto;
        }


        public IActionResult Mostrar()
        {

            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();

            if (ViewBag.Mensaje == "Usuario" || ViewBag.Mensaje == "Administrador")
            {

                List<Adopcion> listadoAdopcion = new List<Adopcion>();
                try
                {
                    MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                    conexion.Open();
                    String sql = "adopciones_solicitadas(@idUsuario)";
                    MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                    conexionCommand.Parameters.AddWithValue("@idUsuario", ViewBag.idUsuarioCooki);
                    MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                    while (mySqlDataReader.Read())
                    {
                        Adopcion adop = new Adopcion();
                        adop.idAdopcion = mySqlDataReader.GetInt32(0);
                        adop.nombreUsuario = mySqlDataReader.GetString(1);
                        adop.telefono = mySqlDataReader.GetString(2);
                        adop.nombreMascota = mySqlDataReader.GetString(3);
                        adop.estadoAdopcion = mySqlDataReader.GetString(4);
                        listadoAdopcion.Add(adop);
                    }
                    conexion.Close();


                }
                catch (Exception)
                {
                    throw;
                }

                return View(listadoAdopcion);
            }
            else
            {
                return RedirectToAction("Error");
            }





        } public IActionResult MostrarSolicitante()
        {
            
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();

            if (ViewBag.Mensaje == "Usuario" || ViewBag.Mensaje == "Administrador")
            {

                List<Adopcion> listadoAdopcion = new List<Adopcion>();
                try
                {
                    MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                    conexion.Open();
                    String sql = "adopciones_publicadas(@idUsuario)";
                    MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                    conexionCommand.Parameters.AddWithValue("@idUsuario", ViewBag.idUsuarioCooki);
                    MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                    while (mySqlDataReader.Read())
                    {
                        Adopcion adop = new Adopcion();
                        adop.idAdopcion = mySqlDataReader.GetInt32(0);
                        adop.nombreUsuario = mySqlDataReader.GetString(1);
                        adop.nombreMascota = mySqlDataReader.GetString(2);
                        adop.estadoAdopcion = mySqlDataReader.GetString(3);
                        listadoAdopcion.Add(adop);
                    }
                    conexion.Close();


                }
                catch (Exception)
                {
                    throw;
                }

                return View(listadoAdopcion);
            }
            else
            {
                return RedirectToAction("Error");
            }
        }

        public IActionResult AprobarAdop(int idAdopcion)
        {
           
            bool validacion = true;

            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                String sql = "call estadoAdopcionAprobado(@idAdopcion, @validacion)";
                MySqlCommand Command = new MySqlCommand(sql, conexion);
                Command.Parameters.AddWithValue("@idAdopcion", idAdopcion);
                Command.Parameters.AddWithValue("@validacion", validacion);
                Command.ExecuteNonQuery();
            }

            return RedirectToAction("Mostrar");

        }


        public IActionResult RechazarAdopcion(int idAdopcion)
        {
            bool validacion = true;

            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                String sql = "call estadoAdopcionRechazado(@idAdopcion, @validacion)";
                MySqlCommand Command = new MySqlCommand(sql, conexion);
                Command.Parameters.AddWithValue("@idAdopcion", idAdopcion);
                Command.Parameters.AddWithValue("@validacion", validacion);
                Command.ExecuteNonQuery();
            }

            return RedirectToAction ("Mostrar");
        }     

    }
}
