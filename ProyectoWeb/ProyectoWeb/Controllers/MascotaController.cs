using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI.Relational;
using ProyectoWeb.Data;
using ProyectoWeb.Models;
using ProyectoWeb.Controllers;
using System.Data;
using System.Web;
using Microsoft.AspNetCore.Http;
using Org.BouncyCastle.Asn1.X509;

namespace ProyectoWeb.Controllers
{ 
    public class MascotaController : Controller
    {
        List<Vacunas> listaVacunas = new List<Vacunas>();
        CookieOptions coo = new CookieOptions();

        private readonly Contexto _contexto;

        public static string animalImg { get; set; }

        public MascotaController(Contexto contexto)
        {
            _contexto = contexto;

        }

         
        public IActionResult Index()
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();

            if (rols.ToString() == "Usuario")
            {
               
                List<Mascota> listarMascotasMias = new List<Mascota>();
                try
                {
                    MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                    conexion.Open();
                    String sql = "obtener_mascota_usuario(@idUsuario)";
                    MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                    conexionCommand.Parameters.AddWithValue("@idUsuario", ViewBag.idUsuarioCooki);
                    MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                    while (mySqlDataReader.Read())
                    {
                        Mascota p = new Mascota();
                        p.idMascota = mySqlDataReader.GetInt32(0);
                        p.nombreMascota = mySqlDataReader.GetString(1);
                        p.edadMascota = mySqlDataReader.GetInt32(2);
                        listarMascotasMias.Add(p);
                    }
                    conexion.Close();


                }
                catch (Exception)
                {
                    throw;
                }
                 
                 
                ViewBag.Mensaje = rols.ToString();
                if (rols.Equals("Usuario"))
                {
                    return View(listarMascotasMias);
                }
                else
                {
                    return RedirectToAction("Index", "Principal");

                }

                ViewBag.role = rols;

            }
            else {
                return RedirectToAction("Error");
            }


        }

        public IActionResult Principal()
        {
            var rols = HttpContext.Request.Cookies["var"];
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            ViewBag.Mensaje = rols.ToString();
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();


            List<Mascota> listaMascota = new List<Mascota>();          
            
            try
            {
                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "call obtener_mascota_NoMia(@id_Usuario)";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                conexionCommand.Parameters.AddWithValue("@id_Usuario", ViewBag.idUsuarioCooki);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    Mascota m = new Mascota();
                    m.idMascota = mySqlDataReader.GetInt32(0);
                    m.nombreMascota = mySqlDataReader.GetString(1);
                    m.edadMascota = mySqlDataReader.GetInt32(2);
                    m.pesoMascota = mySqlDataReader.GetInt32(3);
                    m.generoMascota = mySqlDataReader.GetString(4);
                    m.observaciones = mySqlDataReader.GetString(5);
                    m.estadoMascota = mySqlDataReader.GetString(6);
                    m.raza = mySqlDataReader.GetString(7);
                    m.tpmascota = mySqlDataReader.GetString(8);
                    m.dueno = mySqlDataReader.GetString(9);
                    //m.vacunas = vacunasM(m.idMascota);
                    listaMascota.Add(m);
                }

                conexion.Close();              
                
            }
            catch (Exception)
            {
                throw;
            }

            return View(listaMascota);
        }

        public string RazaMascota(int mascota)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            string raza = "";
            try
            {
                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "obtener_mascota_nombreRaza(@id_Mascota)";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                conexionCommand.Parameters.AddWithValue("@id_Mascota", mascota);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    raza = mySqlDataReader.GetString(0);
                }
                conexion.Close();

            }
            catch (Exception)
            {
                throw;
            }

            return raza;
        }

        public string TipoMascota(int mascota)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            string tipoM = "";
            try
            {
                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "obtener_mascota_tipo(@id_Mascota)";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                conexionCommand.Parameters.AddWithValue("@id_Mascota", mascota);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    tipoM = mySqlDataReader.GetString(0);
                }
                conexion.Close();

            }
            catch (Exception)
            {
                throw;
            }

            return tipoM;
        }


        public string DuenoMascota(int mascota)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            string dueño = "";
            try
            {
                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "obtener_mascota_dueño(@id_Mascota)";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                conexionCommand.Parameters.AddWithValue("@id_Mascota", mascota);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    dueño = mySqlDataReader.GetString(0);
                }
                conexion.Close();

            }
            catch (Exception)
            {
                throw;
            }

            return dueño;
        }

        

        public IActionResult Mostrar()
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();

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
                    Mascota m = new Mascota();
                    m.idMascota = mySqlDataReader.GetInt32(0);
                    m.nombreMascota = mySqlDataReader.GetString(1);
                    m.edadMascota = mySqlDataReader.GetInt32(2);
                    m.pesoMascota = mySqlDataReader.GetInt32(3);
                    m.generoMascota = mySqlDataReader.GetString(4);
                    m.observaciones = mySqlDataReader.GetString(5); 
                    m.estadoMascota = mySqlDataReader.GetString(6);
                    m.raza = mySqlDataReader.GetString(7);
                    m.tpmascota = mySqlDataReader.GetString(8);
                    m.dueno = mySqlDataReader.GetString(9);
                    //m.vacunas = vacunasM(m.idMascota);
                    listaMascota.Add(m);
                }
                conexion.Close();
            }
            catch (Exception)
            {
                throw;
            }
           
            return View(listaMascota);


        }

        public List<Raza> listarRaza()
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            List<Raza> listarRaza = new List<Raza>();
            try
            {
                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "listar_raza";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    Raza raz = new Raza();
                    raz.idRaza = mySqlDataReader.GetInt32(0);
                    raz.nombreRaza = mySqlDataReader.GetString(1);
                    raz.estadoRaza = mySqlDataReader.GetString(2);
                    listarRaza.Add(raz);
                }
                conexion.Close();


            }
            catch (Exception)
            {
                throw;
            }

            return listarRaza;
        }

        public List<Tipo_Mascota> listarTipoMascota()
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            List<Tipo_Mascota> listarlistarTipoMascota = new List<Tipo_Mascota>();
            try
            {
                MySqlConnection conexion = new MySqlConnection(_contexto.Conexion);
                conexion.Open();
                String sql = "listar_tp_mascota";
                MySqlCommand conexionCommand = new MySqlCommand(sql, conexion);
                MySqlDataReader mySqlDataReader = conexionCommand.ExecuteReader();

                while (mySqlDataReader.Read())
                {
                    Tipo_Mascota tp_mascota = new Tipo_Mascota();
                    tp_mascota.idTipoMascota = mySqlDataReader.GetInt32(0);
                    tp_mascota.tipoMascota = mySqlDataReader.GetString(1);
                    tp_mascota.estadoTipoMascota = mySqlDataReader.GetString(2);
                    listarlistarTipoMascota.Add(tp_mascota);
                }
                conexion.Close();


            }
            catch (Exception)
            {
                throw;
            }

            return listarlistarTipoMascota;
        }

        public IActionResult Registrar()
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            ViewBag.generos = generos();

            VacunasController vc = new VacunasController(_contexto);
            ViewBag.vacunas = vc.listarvacunas();

            ViewBag.tp_raza = listarRaza();
            ViewBag.tp_mascota = listarTipoMascota();
            return View();
        }




        [HttpPost]
        public IActionResult Registrar(Mascota masco)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();

            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                MySqlCommand Command = new MySqlCommand("insertar_mascota", conexion);
                Command.CommandType = System.Data.CommandType.StoredProcedure;
                Command.Parameters.AddWithValue("idMascota", masco.idMascota);
                Command.Parameters.AddWithValue("nombreMascota", masco.nombreMascota);
                Command.Parameters.AddWithValue("edadMascota", masco.edadMascota);
                Command.Parameters.AddWithValue("pesoMascota", masco.pesoMascota);
                Command.Parameters.AddWithValue("generoMascota", masco.generoMascota);
                Command.Parameters.AddWithValue("observaciones", masco.observaciones); 
                Command.Parameters.AddWithValue("raza", masco.fk_idRaza);
                Command.Parameters.AddWithValue("tpMascota", masco.fk_idTipo_Mascota);
                Command.Parameters.AddWithValue("Usuario_pertenece", ViewBag.idUsuarioCooki);                
                Command.Parameters.AddWithValue("imagen", animalImg);

                Command.ExecuteNonQuery();
            }

            if (ViewBag.Mensaje == "Administrador")
            {
                return RedirectToAction("Mostrar");
            }
            else
            {
                return RedirectToAction("Index");
            }
        }




        [HttpGet]
        public IActionResult Editar(int id)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();

            Mascota m = new Mascota();
            DataTable tabla = new DataTable();
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                string sql = "obtener_mascotaTodo(@idMascota)";
                MySqlDataAdapter sqlData = new MySqlDataAdapter(sql, conexion);
                sqlData.SelectCommand.Parameters.AddWithValue("@idMascota", id);
                sqlData.Fill(tabla);
            }
            if (tabla.Rows.Count == 1)
            {
                m.idMascota = Convert.ToInt32(tabla.Rows[0][0].ToString());
                m.nombreMascota = tabla.Rows[0][1].ToString();
                m.edadMascota = Convert.ToInt32(tabla.Rows[0][2].ToString());
                m.pesoMascota = Convert.ToInt32(tabla.Rows[0][3].ToString());
                m.generoMascota = tabla.Rows[0][4].ToString();
                m.observaciones = tabla.Rows[0][5].ToString();
                m.estadoMascota = tabla.Rows[0][6].ToString();
                m.fk_idRaza = Convert.ToInt32(tabla.Rows[0][7].ToString());
                m.fk_idTipo_Mascota = Convert.ToInt32(tabla.Rows[0][8].ToString());
                m.fk_idUsuario = Convert.ToInt32(tabla.Rows[0][9].ToString());
                m.imagen = tabla.Rows[0][10].ToString();

                return View(m);
            }
            else
            {
                return RedirectToAction("Mostrar");
            }
        }



        [HttpPost]
        public IActionResult Editar(Mascota mascota)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();
            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                String sql = "call editar_mascota(@idMascota,@nombreMascota,@edadMascota,@pesoMascota,@observaciones,@estadoMascota)";

                MySqlCommand Command = new MySqlCommand(sql, conexion);
                Command.Parameters.AddWithValue("@idMascota", mascota.idMascota);
                Command.Parameters.AddWithValue("@nombreMascota", mascota.nombreMascota);
                Command.Parameters.AddWithValue("@edadMascota", mascota.edadMascota);
                Command.Parameters.AddWithValue("@pesoMascota", mascota.pesoMascota);
                Command.Parameters.AddWithValue("@observaciones", mascota.observaciones);
                Command.Parameters.AddWithValue("@estadoMascota", mascota.estadoMascota);
                Command.ExecuteNonQuery();
               
            }
            //conexion.Close();

            if (ViewBag.Mensaje == "Administrador")
            {
                return RedirectToAction("Mostrar");
            }
            else
            {
                return RedirectToAction("Index");
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
                String sql = "call eliminar_mascota(@idMascota)";
                MySqlCommand Command = new MySqlCommand(sql, conexion);
                Command.Parameters.AddWithValue("@idMascota", id);
                Command.ExecuteNonQuery();
            }

            if (ViewBag.Mensaje == "Administrador")
            {
                return RedirectToAction("Mostrar");
            }
            else
            {
                return RedirectToAction("Index");
            }

        }

        public IActionResult InsertarAdopcion(int id)
        {
            var idUsuarioCooki = HttpContext.Request.Cookies["idUsuario"];
            var rols = HttpContext.Request.Cookies["var"];
            ViewBag.idUsuarioCooki = idUsuarioCooki.ToString();
            ViewBag.Mensaje = rols.ToString();

            using (MySqlConnection conexion = new MySqlConnection(_contexto.Conexion))
            {
                conexion.Open();
                String sql = "call insertar_adopcion(@id_mascota, @idUsuario)";
                MySqlCommand Command = new MySqlCommand(sql, conexion);
                Command.Parameters.AddWithValue("@id_mascota", id);
                Command.Parameters.AddWithValue("@idUsuario", ViewBag.idUsuarioCooki);
                Command.ExecuteNonQuery();
            }

            return RedirectToAction("Principal");
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


        [HttpPost]
        public void SetAnimalImgs(string animalImgs)
        {
            animalImg = animalImgs;
        }
       
    }
}
