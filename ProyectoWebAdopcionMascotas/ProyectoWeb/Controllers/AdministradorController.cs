using Microsoft.AspNetCore.Mvc;
using ProyectoWeb.Data;
using ProyectoWeb.Controllers;
using MySql.Data.MySqlClient;
using ProyectoWeb.Models;

namespace ProyectoWeb.Controllers
{
    public class AdministradorController : Controller
    {
        private readonly Contexto _contexto;

        CookieOptions coo = new CookieOptions();
        public AdministradorController(Contexto contexto)
        {
            _contexto = contexto;
        }

        public List<string> tpMascota()
        {
            List<string> listadotp = new List<string>();
            try
            {
                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "listar_tp_mascota";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    listadotp.Add(mySqlDataReader.GetString(1));
                }
                conexion.Close();


            }
            catch (Exception)
            {
                throw;
            }
            
            return listadotp;
        }

        public List<string> razas()
        {
            List<string> listadoraza = new List<string>();
            try
            {
                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "listar_raza";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    listadoraza.Add(mySqlDataReader.GetString(1));
                }
                conexion.Close();


            }
            catch (Exception)
            {
                throw;
            }

            return listadoraza;
        }

        public List<string> generos()
        {
            List<string> listadogenero = new List<string>();
            try
            {
                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "genero_mascota";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    listadogenero.Add(mySqlDataReader.GetString(0));
                }
                conexion.Close();


            }
            catch (Exception)
            {
                throw;
            }

            return listadogenero;
        }

        public List<string> estados()
        {
            List<string> listadoestados = new List<string>();
            try
            {
                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "estado_mascota";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    listadoestados.Add(mySqlDataReader.GetString(0));
                }
                conexion.Close();


            }
            catch (Exception)
            {
                throw;
            }

            return listadoestados;
        }

        public List<string> edades()
        {
            List<string> listadoedades = new List<string>();
            try
            {
                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "edad_mascota";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    listadoedades.Add(mySqlDataReader.GetString(0));
                }
                conexion.Close();


            }
            catch (Exception)
            {
                throw;
            }

            return listadoedades;
        }

        public IActionResult Principal()
        {
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.Mensaje = rols.ToString();
            ViewBag.listadotp = tpMascota();
            ViewBag.listadoraza = razas();
            ViewBag.listadogenero = generos();
            ViewBag.listadoestados = estados();
            ViewBag.listadoedades = edades();

            if (ViewBag.Mensaje == "Administrador")
            {
                return View();
            }
            else
            {
                return RedirectToAction("Error");
            } 
        }


    }
}
