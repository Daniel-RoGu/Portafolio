using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using ProyectoWeb.Data;
using ProyectoWeb.Models;
using System;
using System.Collections.Generic;
using System.Data;

namespace ProyectoWeb.Controllers
{
    public class PrincipalController : Controller
    {
        CookieOptions coo = new CookieOptions();
        private readonly Contexto _contexto;

        public PrincipalController(Contexto contexto)
        {
            _contexto = contexto;
        }

        public IActionResult Index()
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            if (rols != null)
            {
                ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
                ViewBag.Mensaje = rols.ToString();
            }

            ViewBag.listMascota = listarMascota();
            return View();
        }

        public List<Mascota> listarMascota()
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];

            if (rols != null)
            {
                ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
                ViewBag.Mensaje = rols.ToString();
            }


            List<Mascota> listaMascota = new List<Mascota>();
            try
            {
                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "listar_mascota";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    Mascota p = new Mascota();
                    p.imagen = mySqlDataReader.GetString(0);
                    p.nombreMascota = mySqlDataReader.GetString(1);
                    p.edadMascota = mySqlDataReader.GetInt32(2);

                    listaMascota.Add(p);
                }
                conexion.Close();


            }
            catch (Exception)
            {
                throw;
            }

            return listaMascota;
        }

        public IActionResult Consultar()
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            return View();
        }
    }
}

